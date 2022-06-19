/*
** $Id: lbaselib.c,v 1.313 2016/04/11 19:18:40 roberto Exp $
** Basic library
** See Copyright Notice in lua.h
*/

#define lbaselib_c
#define LUA_LIB

#include "lprefix.h"


#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "lua.h"

#include "lauxlib.h"
#include "lualib.h"


#ifdef __ANDROID__
#include <android/log.h>
#define LOG_TAG "lua"
#define LOGD(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#endif

static int luaB_print (lua_State *L) {
  int n = lua_gettop(L);  /* number of arguments */
  int i;
  lua_getglobal(L, "tostring");
  for (i=1; i<=n; i++) {
    const char *s;
    size_t l;
    lua_pushvalue(L, -1);  /* function to be called */
    lua_pushvalue(L, i);   /* value to print */
    lua_call(L, 1, 1);
    s = lua_tolstring(L, -1, &l);  /* get result */
    if (s == NULL)
      return luaL_error(L, "'tostring' must return a string to 'print'");
    if (i>1) lua_writestring("\t", 1);
    lua_writestring(s, l);
#ifdef __ANDROID__
	LOGD("%s", s);
#endif
    lua_pop(L, 1);  /* pop result */
  }
  lua_writeline();
  return 0;
}



#define SPACECHARS	" \f\n\r\t\v"

static const char *b_str2int (const char *s, int base, lua_Integer *pn) {
  lua_Unsigned n = 0;
  int neg = 0;
  s += strspn(s, SPACECHARS);  /* skip initial spaces */
  if (*s == '-') { s++; neg = 1; }  /* handle signal */
  else if (*s == '+') s++;
  if (!isalnum((unsigned char)*s))  /* no digit? */
    return NULL;
  do {
    int digit = (isdigit((unsigned char)*s)) ? *s - '0'
                   : (toupper((unsigned char)*s) - 'A') + 10;
    if (digit >= base) return NULL;  /* invalid numeral */
    n = n * base + digit;
    s++;
  } while (isalnum((unsigned char)*s));
  s += strspn(s, SPACECHARS);  /* skip trailing spaces */
  *pn = (lua_Integer)((neg) ? (0u - n) : n);
  return s;
}


static int luaB_tonumber (lua_State *L) {
  if (lua_isnoneornil(L, 2)) {  /* standard conversion? */
    luaL_checkany(L, 1);
    if (lua_type(L, 1) == LUA_TNUMBER) {  /* already a number? */
      lua_settop(L, 1);  /* yes; return it */
      return 1;
    }
    else {
      size_t l;
      const char *s = lua_tolstring(L, 1, &l);
      if (s != NULL && lua_stringtonumber(L, s) == l + 1)
        return 1;  /* successful conversion to number */
      /* else not a number */
    }
  }
  else {
    size_t l;
    const char *s;
    lua_Integer n = 0;  /* to avoid warnings */
    lua_Integer base = luaL_checkinteger(L, 2);
    luaL_checktype(L, 1, LUA_TSTRING);  /* no numbers as strings */
    s = lua_tolstring(L, 1, &l);
    luaL_argcheck(L, 2 <= base && base <= 36, 2, "base out of range");
    if (b_str2int(s, (int)base, &n) == s + l) {
      lua_pushinteger(L, n);
      return 1;
    }  /* else not a number */
  }  /* else not a number */
  lua_pushnil(L);  /* not a number */
  return 1;
}


//mod by nirenr
static int luaB_tointeger (lua_State *L) {
  if (lua_type(L, 1) == LUA_TNUMBER){
    if (lua_isinteger(L, 1)) {
      lua_settop(L, 1);
      return 1;
	}
	else {
	  lua_Number n = lua_tonumber(L, 1);
	  lua_pushinteger(L, (lua_Integer)n);
	  return 1;
	}
  }
  else {
    size_t l;
    const char *s = luaL_tolstring(L, 1, &l);
    if (s != NULL && lua_stringtonumber(L, s) == l + 1) {
      lua_Number n = lua_tonumber(L, 1);
	  lua_pushinteger(L, (lua_Integer)n);
	  return 1;
	}
  }
  lua_pushnil(L);
  return 1;
}


static int luaB_error (lua_State *L) {
  int level = (int)luaL_optinteger(L, 2, 1);
  lua_settop(L, 1);
  if (lua_type(L, 1) == LUA_TSTRING && level > 0) {
    luaL_where(L, level);   /* add extra information */
    lua_pushvalue(L, 1);
    lua_concat(L, 2);
  }
  return lua_error(L);
}


static int luaB_getmetatable (lua_State *L) {
  luaL_checkany(L, 1);
  if (!lua_getmetatable(L, 1)) {
    lua_pushnil(L);
    return 1;  /* no metatable */
  }
  luaL_getmetafield(L, 1, "__metatable");
  return 1;  /* returns either __metatable field (if present) or metatable */
}


static int luaB_setmetatable (lua_State *L) {
  int t = lua_type(L, 2);
  luaL_checktype(L, 1, LUA_TTABLE);
  luaL_argcheck(L, t == LUA_TNIL || t == LUA_TTABLE, 2,
                    "nil or table expected");
  if (luaL_getmetafield(L, 1, "__metatable") != LUA_TNIL)
    return luaL_error(L, "cannot change a protected metatable");
  lua_settop(L, 2);
  lua_setmetatable(L, 1);
  return 1;
}

//--mod by nirenr
static int luaB_setmetamethod (lua_State *L) {
  int t = lua_type(L, 3);
  luaL_checktype(L, 1, LUA_TTABLE);
  luaL_argcheck(L, t == LUA_TNIL || t == LUA_TTABLE || t == LUA_TFUNCTION, 2,
                "table function or nil expected");
  if (luaL_getmetafield(L, 1, "__metatable") != LUA_TNIL)
    return luaL_error(L, "cannot change a protected metatable");
  lua_settop(L, 3);
  lua_getmetatable(L,1);
  if(lua_type(L,4)!=LUA_TTABLE){
    lua_settop(L, 3);
    lua_newtable(L);
    lua_setmetatable(L, 1);
    lua_getmetatable(L, 1);
  }
  lua_insert(L,2);
  lua_settable(L,2);
    lua_settop(L,1);
  return 1;
}
//---

static int luaB_rawequal (lua_State *L) {
  luaL_checkany(L, 1);
  luaL_checkany(L, 2);
  lua_pushboolean(L, lua_rawequal(L, 1, 2));
  return 1;
}


static int luaB_rawlen (lua_State *L) {
  int t = lua_type(L, 1);
  luaL_argcheck(L, t == LUA_TTABLE || t == LUA_TSTRING, 1,
                   "table or string expected");
  lua_pushinteger(L, lua_rawlen(L, 1));
  return 1;
}


static int luaB_rawget (lua_State *L) {
  luaL_checktype(L, 1, LUA_TTABLE);
  luaL_checkany(L, 2);
  lua_settop(L, 2);
  lua_rawget(L, 1);
  return 1;
}

static int luaB_rawset (lua_State *L) {
  luaL_checktype(L, 1, LUA_TTABLE);
  luaL_checkany(L, 2);
  luaL_checkany(L, 3);
  lua_settop(L, 3);
  lua_rawset(L, 1);
  return 1;
}


static int luaB_collectgarbage (lua_State *L) {
  static const char *const opts[] = {"stop", "restart", "collect",
    "count", "step", "setpause", "setstepmul",
    "isrunning", NULL};
  static const int optsnum[] = {LUA_GCSTOP, LUA_GCRESTART, LUA_GCCOLLECT,
    LUA_GCCOUNT, LUA_GCSTEP, LUA_GCSETPAUSE, LUA_GCSETSTEPMUL,
    LUA_GCISRUNNING};
  int o = optsnum[luaL_checkoption(L, 1, "collect", opts)];
  int ex = (int)luaL_optinteger(L, 2, 0);
  int res = lua_gc(L, o, ex);
  switch (o) {
    case LUA_GCCOUNT: {
      int b = lua_gc(L, LUA_GCCOUNTB, 0);
      lua_pushnumber(L, (lua_Number)res + ((lua_Number)b/1024));
      return 1;
    }
    case LUA_GCSTEP: case LUA_GCISRUNNING: {
      lua_pushboolean(L, res);
      return 1;
    }
    default: {
      lua_pushinteger(L, res);
      return 1;
    }
  }
}


static int luaB_type (lua_State *L) {
  int t = lua_type(L, 1);
  luaL_argcheck(L, t != LUA_TNONE, 1, "value expected");
  if (luaL_callmeta(L, 1, "__type")){
    //lua_pushstring(L, lua_typename(L, t));
    //lua_pushvalue(L,-2);
    return 1;
  }
  lua_pushstring(L, lua_typename(L, t));
  return 1;
}


static int pairsmeta (lua_State *L, const char *method, int iszero,
                      lua_CFunction iter) {
  if (luaL_getmetafield(L, 1, method) == LUA_TNIL) {  /* no metamethod? */
    luaL_checktype(L, 1, LUA_TTABLE);  /* argument must be a table */
    lua_pushcfunction(L, iter);  /* will return generator, */
    lua_pushvalue(L, 1);  /* state, */
    if (iszero) lua_pushinteger(L, 0);  /* and initial value */
    else lua_pushnil(L);
  }
  else {
    lua_pushvalue(L, 1);  /* argument 'self' to metamethod */
    lua_call(L, 1, 3);  /* get 3 values from metamethod */
  }
  return 3;
}


static int luaB_next (lua_State *L) {
  luaL_checktype(L, 1, LUA_TTABLE);
  lua_settop(L, 2);  /* create a 2nd argument if there isn't one */
  if (lua_next(L, 1))
    return 2;
  else {
    lua_pushnil(L);
    return 1;
  }
}


static int luaB_pairs (lua_State *L) {
  return pairsmeta(L, "__pairs", 0, luaB_next);
}


/*
** Traversal function for 'ipairs'
*/
static int ipairsaux (lua_State *L) {
  lua_Integer i = luaL_checkinteger(L, 2) + 1;
  lua_pushinteger(L, i);
  return (lua_geti(L, 1, i) == LUA_TNIL) ? 1 : 2;
}


/*
** 'ipairs' function. Returns 'ipairsaux', given "table", 0.
** (The given "table" may not be a table.)
*/
static int luaB_ipairs (lua_State *L) {
#if defined(LUA_COMPAT_IPAIRS)
  return pairsmeta(L, "__ipairs", 1, ipairsaux);
#else
  luaL_checkany(L, 1);
  lua_pushcfunction(L, ipairsaux);  /* iteration function */
  lua_pushvalue(L, 1);  /* state */
  lua_pushinteger(L, 0);  /* initial value */
  return 3;
#endif
}


static int load_aux (lua_State *L, int status, int envidx) {
  if (status == LUA_OK) {
    if (envidx != 0) {  /* 'env' parameter? */
      lua_pushvalue(L, envidx);  /* environment for loaded function */
      if (!lua_setupvalue(L, -2, 1))  /* set it as 1st upvalue */
        lua_pop(L, 1);  /* remove 'env' if not used by previous call */
    }
    return 1;
  }
  else {  /* error (message is on top of the stack) */
    lua_pushnil(L);
    lua_insert(L, -2);  /* put before error message */
    return 2;  /* return nil plus error message */
  }
}


static int luaB_loadfile (lua_State *L) {
  const char *fname = luaL_optstring(L, 1, NULL);
  const char *mode = luaL_optstring(L, 2, NULL);
  int env = (!lua_isnone(L, 3) ? 3 : 0);  /* 'env' index or 0 if no 'env' */
  int status = luaL_loadfilex(L, fname, mode);
  return load_aux(L, status, env);
}


/*
** {======================================================
** Generic Read function
** =======================================================
*/


/*
** reserved slot, above all arguments, to hold a copy of the returned
** string to avoid it being collected while parsed. 'load' has four
** optional arguments (chunk, source name, mode, and environment).
*/
#define RESERVEDSLOT	5


/*
** Reader for generic 'load' function: 'lua_load' uses the
** stack for internal stuff, so the reader cannot change the
** stack top. Instead, it keeps its resulting string in a
** reserved slot inside the stack.
*/
static const char *generic_reader (lua_State *L, void *ud, size_t *size) {
  (void)(ud);  /* not used */
  luaL_checkstack(L, 2, "too many nested functions");
  lua_pushvalue(L, 1);  /* get function */
  lua_call(L, 0, 1);  /* call it */
  if (lua_isnil(L, -1)) {
    lua_pop(L, 1);  /* pop result */
    *size = 0;
    return NULL;
  }
  else if (!lua_isstring(L, -1))
    luaL_error(L, "reader function must return a string");
  lua_replace(L, RESERVEDSLOT);  /* save string in reserved slot */
  return lua_tolstring(L, RESERVEDSLOT, size);
}


static int luaB_load (lua_State *L) {
  int status;
  size_t l;
  const char *s = lua_tolstring(L, 1, &l);
  const char *mode = luaL_optstring(L, 3, "bt");
  int env = (!lua_isnone(L, 4) ? 4 : 0);  /* 'env' index or 0 if no 'env' */
  if (s != NULL) {  /* loading a string? */
    const char *chunkname = luaL_optstring(L, 2, s);
    status = luaL_loadbufferx(L, s, l, chunkname, mode);
  }
  else {  /* loading from a reader function */
    const char *chunkname = luaL_optstring(L, 2, "=(load)");
    luaL_checktype(L, 1, LUA_TFUNCTION);
    lua_settop(L, RESERVEDSLOT);  /* create reserved slot */
    status = lua_load(L, generic_reader, NULL, chunkname, mode);
  }
  return load_aux(L, status, env);
}

static int luaB_loadstring (lua_State *L) {
  int status;
  size_t l;
  const char *s = luaL_checklstring(L, 1, &l);
  const char *mode = luaL_optstring(L, 3, "bt");
  int env = (!lua_isnone(L, 4) ? 4 : 0);  /* 'env' index or 0 if no 'env' */
  const char *chunkname = luaL_optstring(L, 2, s);
  status = luaL_loadbufferx(L, s, l, chunkname, mode);
  return load_aux(L, status, env);
}
/* }====================================================== */


static int dofilecont (lua_State *L, int d1, lua_KContext d2) {
  (void)d1;  (void)d2;  /* only to match 'lua_Kfunction' prototype */
  return lua_gettop(L) - 1;
}


static int luaB_dofile (lua_State *L) {
  const char *fname = luaL_optstring(L, 1, NULL);
  lua_settop(L, 1);
  if (luaL_loadfile(L, fname) != LUA_OK)
    return lua_error(L);
  lua_callk(L, 0, LUA_MULTRET, 0, dofilecont);
  return dofilecont(L, 0, 0);
}


static int luaB_assert (lua_State *L) {
  if (lua_toboolean(L, 1))  /* condition is true? */
    return lua_gettop(L);  /* return all arguments */
  else {  /* error */
    luaL_checkany(L, 1);  /* there must be a condition */
    lua_remove(L, 1);  /* remove it */
    lua_pushliteral(L, "assertion failed!");  /* default message */
    lua_settop(L, 1);  /* leave only message (default if no other one) */
    return luaB_error(L);  /* call 'error' */
  }
}


static int luaB_select (lua_State *L) {
  int n = lua_gettop(L);
  if (lua_type(L, 1) == LUA_TSTRING && *lua_tostring(L, 1) == '#') {
    lua_pushinteger(L, n-1);
    return 1;
  }
  else {
    lua_Integer i = luaL_checkinteger(L, 1);
    if (i < 0) i = n + i;
    else if (i > n) i = n;
    luaL_argcheck(L, 1 <= i, 1, "index out of range");
    return n - (int)i;
  }
}


/*
** Continuation function for 'pcall' and 'xpcall'. Both functions
** already pushed a 'true' before doing the call, so in case of success
** 'finishpcall' only has to return everything in the stack minus
** 'extra' values (where 'extra' is exactly the number of items to be
** ignored).
*/
static int finishpcall (lua_State *L, int status, lua_KContext extra) {
  if (status != LUA_OK && status != LUA_YIELD) {  /* error? */
    lua_pushboolean(L, 0);  /* first result (false) */
    lua_pushvalue(L, -2);  /* error message */
    return 2;  /* return false, msg */
  }
  else
    return lua_gettop(L) - (int)extra;  /* return all results */
}


static int luaB_pcall (lua_State *L) {
  int status;
  luaL_checkany(L, 1);
  lua_pushboolean(L, 1);  /* first result if no errors */
  lua_insert(L, 1);  /* put it in place */
  status = lua_pcallk(L, lua_gettop(L) - 2, LUA_MULTRET, 0, 0, finishpcall);
  return finishpcall(L, status, 0);
}


/*
** Do a protected call with error handling. After 'lua_rotate', the
** stack will have <f, err, true, f, [args...]>; so, the function passes
** 2 to 'finishpcall' to skip the 2 first values when returning results.
*/
static int luaB_xpcall (lua_State *L) {
  int status;
  int n = lua_gettop(L);
  luaL_checktype(L, 2, LUA_TFUNCTION);  /* check error function */
  lua_pushboolean(L, 1);  /* first result */
  lua_pushvalue(L, 1);  /* function */
  lua_rotate(L, 3, 2);  /* move them below function's arguments */
  status = lua_pcallk(L, n - 2, LUA_MULTRET, 2, 2, finishpcall);
  return finishpcall(L, status, 2);
}


static int luaB_tostring (lua_State *L) {
  luaL_checkany(L, 1);
  luaL_tolstring(L, 1, NULL);
  return 1;
}

/*
** LuaFileSystem
** Copyright Kepler Project 2003 - 2017 (http://keplerproject.github.io/luafilesystem)
**
** File system manipulation library.
** This library offers these functions:
**   lfs.attributes (filepath [, attributename | attributetable])
**   lfs.chdir (path)
**   lfs.currentdir ()
**   lfs.dir (path)
**   lfs.link (old, new[, symlink])
**   lfs.lock (fh, mode)
**   lfs.lock_dir (path)
**   lfs.mkdir (path)
**   lfs.rmdir (path)
**   lfs.setmode (filepath, mode)
**   lfs.symlinkattributes (filepath [, attributename])
**   lfs.touch (filepath [, atime [, mtime]])
**   lfs.unlock (fh)
*/

#ifndef LFS_DO_NOT_USE_LARGE_FILE
#ifndef _WIN32
#ifndef _AIX
#define _FILE_OFFSET_BITS 64 /* Linux, Solaris and HP-UX */
#else
#define _LARGE_FILES 1 /* AIX */
#endif
#endif
#endif

#ifndef LFS_DO_NOT_USE_LARGE_FILE
#define _LARGEFILE64_SOURCE
#endif

#include <errno.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#include <sys/stat.h>

#ifdef _WIN32
  #include <direct.h>
  #include <windows.h>
  #include <io.h>
  #include <sys/locking.h>
  #ifdef __BORLANDC__
    #include <utime.h>
  #else
    #include <sys/utime.h>
  #endif
  #include <fcntl.h>
  /* MAX_PATH seems to be 260. Seems kind of small. Is there a better one? */
  #define LFS_MAXPATHLEN MAX_PATH
#else
  #include <unistd.h>
  #include <dirent.h>
  #include <fcntl.h>
  #include <sys/types.h>
  #include <utime.h>
  #include <sys/param.h> /* for MAXPATHLEN */
  #define LFS_MAXPATHLEN MAXPATHLEN
#endif

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#include "lfs.h"

#define LFS_VERSION "1.7.0"
#define LFS_LIBNAME "lfs"

#if LUA_VERSION_NUM >= 503 /* Lua 5.3 */

#ifndef luaL_optlong
#define luaL_optlong luaL_optinteger
#endif

#endif

#if LUA_VERSION_NUM >= 502
#  define new_lib(L, l) (luaL_newlib(L, l))
#else
#  define new_lib(L, l) (lua_newtable(L), luaL_register(L, NULL, l))
#endif

/* Define 'strerror' for systems that do not implement it */
#ifdef NO_STRERROR
#define strerror(_)     "System unable to describe the error"
#endif

#define DIR_METATABLE "directory metatable"
typedef struct dir_data {
        int  closed;
#ifdef _WIN32
        intptr_t hFile;
        char pattern[MAX_PATH+1];
#else
        DIR *dir;
#endif
} dir_data;

#define LOCK_METATABLE "lock metatable"

#ifdef _WIN32
 #ifdef __BORLANDC__
  #define lfs_setmode(file, m)   (setmode(_fileno(file), m))
  #define STAT_STRUCT struct stati64
 #else
  #define lfs_setmode(file, m)   (_setmode(_fileno(file), m))
  #define STAT_STRUCT struct _stati64
 #endif
#define STAT_FUNC _stati64
#define LSTAT_FUNC STAT_FUNC
#else
#define _O_TEXT               0
#define _O_BINARY             0
#define lfs_setmode(file, m)   ((void)file, (void)m, 0)
#define STAT_STRUCT struct stat
#define STAT_FUNC stat
#define LSTAT_FUNC lstat
#endif

#ifdef _WIN32
  #define lfs_mkdir _mkdir
#else
  #define lfs_mkdir(path) (mkdir((path), \
    S_IRUSR | S_IWUSR | S_IXUSR | S_IRGRP | S_IWGRP | S_IXGRP | S_IROTH | S_IXOTH))
#endif

/*
** Utility functions
*/
static int pusherror(lua_State *L, const char *info)
{
        lua_pushnil(L);
        if (info==NULL)
                lua_pushstring(L, strerror(errno));
        else
                lua_pushfstring(L, "%s: %s", info, strerror(errno));
        lua_pushinteger(L, errno);
        return 3;
}

static int pushresult(lua_State *L, int res, const char *info) {
  if (res == -1) {
    return pusherror(L, info);
  } else {
    lua_pushboolean(L, 1);
    return 1;
  }
}


/*
** This function changes the working (current) directory
*/
static int change_dir (lua_State *L) {
        const char *path = luaL_checkstring(L, 1);
        if (chdir(path)) {
                lua_pushnil (L);
                lua_pushfstring (L,"Unable to change working directory to '%s'\n%s\n",
                                path, chdir_error);
                return 2;
        } else {
                lua_pushboolean (L, 1);
                return 1;
        }
}

/*
** This function returns the current directory
** If unable to get the current directory, it returns nil
**  and a string describing the error
*/
static int get_dir (lua_State *L) {
#ifdef NO_GETCWD
    lua_pushnil(L);
    lua_pushstring(L, "Function 'getcwd' not provided by system");
    return 2;
#else
    char *path = NULL;
    /* Passing (NULL, 0) is not guaranteed to work. Use a temp buffer and size instead. */
    size_t size = LFS_MAXPATHLEN; /* initial buffer size */
    int result;
    while (1) {
        path = realloc(path, size);
        if (!path) /* failed to allocate */
            return pusherror(L, "get_dir realloc() failed");
        if (getcwd(path, size) != NULL) {
            /* success, push the path to the Lua stack */
            lua_pushstring(L, path);
            result = 1;
            break;
        }
        if (errno != ERANGE) { /* unexpected error */
            result = pusherror(L, "get_dir getcwd() failed");
            break;
        }
        /* ERANGE = insufficient buffer capacity, double size and retry */
        size *= 2;
    }
    free(path);
    return result;
#endif
}

/*
** Check if the given element on the stack is a file and returns it.
*/
static FILE *check_file (lua_State *L, int idx, const char *funcname) {
#if LUA_VERSION_NUM == 501
        FILE **fh = (FILE **)luaL_checkudata (L, idx, "FILE*");
        if (*fh == NULL) {
                luaL_error (L, "%s: closed file", funcname);
                return 0;
        } else
                return *fh;
#elif LUA_VERSION_NUM >= 502 && LUA_VERSION_NUM <= 909
        luaL_Stream *fh = (luaL_Stream *)luaL_checkudata (L, idx, "FILE*");
        if (fh->closef == 0 || fh->f == NULL) {
                luaL_error (L, "%s: closed file", funcname);
                return 0;
        } else
                return fh->f;
#else
#error unsupported Lua version
#endif
}


/*
**
*/
static int _file_lock (lua_State *L, FILE *fh, const char *mode, const long start, long len, const char *funcname) {
        int code;
#ifdef _WIN32
        /* lkmode valid values are:
           LK_LOCK    Locks the specified bytes. If the bytes cannot be locked, the program immediately tries again after 1 second. If, after 10 attempts, the bytes cannot be locked, the constant returns an error.
           LK_NBLCK   Locks the specified bytes. If the bytes cannot be locked, the constant returns an error.
           LK_NBRLCK  Same as _LK_NBLCK.
           LK_RLCK    Same as _LK_LOCK.
           LK_UNLCK   Unlocks the specified bytes, which must have been previously locked.

           Regions should be locked only briefly and should be unlocked before closing a file or exiting the program.

           http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vclib/html/_crt__locking.asp
        */
        int lkmode;
        switch (*mode) {
                case 'r': lkmode = LK_NBLCK; break;
                case 'w': lkmode = LK_NBLCK; break;
                case 'u': lkmode = LK_UNLCK; break;
                default : return luaL_error (L, "%s: invalid mode", funcname);
        }
        if (!len) {
                fseek (fh, 0L, SEEK_END);
                len = ftell (fh);
        }
        fseek (fh, start, SEEK_SET);
#ifdef __BORLANDC__
        code = locking (fileno(fh), lkmode, len);
#else
        code = _locking (fileno(fh), lkmode, len);
#endif
#else
        struct flock f;
        switch (*mode) {
                case 'w': f.l_type = F_WRLCK; break;
                case 'r': f.l_type = F_RDLCK; break;
                case 'u': f.l_type = F_UNLCK; break;
                default : return luaL_error (L, "%s: invalid mode", funcname);
        }
        f.l_whence = SEEK_SET;
        f.l_start = (off_t)start;
        f.l_len = (off_t)len;
        code = fcntl (fileno(fh), F_SETLK, &f);
#endif
        return (code != -1);
}

#ifdef _WIN32
typedef struct lfs_Lock {
  HANDLE fd;
} lfs_Lock;
static int lfs_lock_dir(lua_State *L) {
  size_t pathl; HANDLE fd;
  lfs_Lock *lock;
  char *ln;
  const char *lockfile = "/lockfile.lfs";
  const char *path = luaL_checklstring(L, 1, &pathl);
  ln = (char*)malloc(pathl + strlen(lockfile) + 1);
  if(!ln) {
    lua_pushnil(L); lua_pushstring(L, strerror(errno)); return 2;
  }
  strcpy(ln, path); strcat(ln, lockfile);
  if((fd = CreateFile(ln, GENERIC_WRITE, 0, NULL, CREATE_NEW,
                FILE_ATTRIBUTE_NORMAL | FILE_FLAG_DELETE_ON_CLOSE, NULL)) == INVALID_HANDLE_VALUE) {
        int en = GetLastError();
        free(ln); lua_pushnil(L);
        if(en == ERROR_FILE_EXISTS || en == ERROR_SHARING_VIOLATION)
                lua_pushstring(L, "File exists");
        else
                lua_pushstring(L, strerror(en));
        return 2;
  }
  free(ln);
  lock = (lfs_Lock*)lua_newuserdata(L, sizeof(lfs_Lock));
  lock->fd = fd;
  luaL_getmetatable (L, LOCK_METATABLE);
  lua_setmetatable (L, -2);
  return 1;
}
static int lfs_unlock_dir(lua_State *L) {
  lfs_Lock *lock = (lfs_Lock *)luaL_checkudata(L, 1, LOCK_METATABLE);
  if(lock->fd != INVALID_HANDLE_VALUE) {    
    CloseHandle(lock->fd);
    lock->fd=INVALID_HANDLE_VALUE;
  }
  return 0;
}
#else
typedef struct lfs_Lock {
  char *ln;
} lfs_Lock;
static int lfs_lock_dir(lua_State *L) {
  lfs_Lock *lock;
  size_t pathl;
  char *ln;
  const char *lockfile = "/lockfile.lfs";
  const char *path = luaL_checklstring(L, 1, &pathl);
  lock = (lfs_Lock*)lua_newuserdata(L, sizeof(lfs_Lock));
  ln = (char*)malloc(pathl + strlen(lockfile) + 1);
  if(!ln) {
    lua_pushnil(L); lua_pushstring(L, strerror(errno)); return 2;
  }
  strcpy(ln, path); strcat(ln, lockfile);
  if(symlink("lock", ln) == -1) {
    free(ln); lua_pushnil(L);
    lua_pushstring(L, strerror(errno)); return 2;
  }
  lock->ln = ln;
  luaL_getmetatable (L, LOCK_METATABLE);
  lua_setmetatable (L, -2);
  return 1;
}
static int lfs_unlock_dir(lua_State *L) {
  lfs_Lock *lock = (lfs_Lock *)luaL_checkudata(L, 1, LOCK_METATABLE);
  if(lock->ln) {
    unlink(lock->ln);
    free(lock->ln);
    lock->ln = NULL;
  }
  return 0;
}
#endif

static int lfs_g_setmode (lua_State *L, FILE *f, int arg) {
  static const int mode[] = {_O_BINARY, _O_TEXT};
  static const char *const modenames[] = {"binary", "text", NULL};
  int op = luaL_checkoption(L, arg, NULL, modenames);
  int res = lfs_setmode(f, mode[op]);
  if (res != -1) {
    int i;
    lua_pushboolean(L, 1);
    for (i = 0; modenames[i] != NULL; i++) {
      if (mode[i] == res) {
        lua_pushstring(L, modenames[i]);
        return 2;
      }
    }
    lua_pushnil(L);
    return 2;
  } else {
    return pusherror(L, NULL);
  }
}

static int lfs_f_setmode(lua_State *L) {
  return lfs_g_setmode(L, check_file(L, 1, "setmode"), 2);
}

/*
** Locks a file.
** @param #1 File handle.
** @param #2 String with lock mode ('w'rite, 'r'ead).
** @param #3 Number with start position (optional).
** @param #4 Number with length (optional).
*/
static int file_lock (lua_State *L) {
        FILE *fh = check_file (L, 1, "lock");
        const char *mode = luaL_checkstring (L, 2);
        const long start = (long) luaL_optinteger (L, 3, 0);
        long len = (long) luaL_optinteger (L, 4, 0);
        if (_file_lock (L, fh, mode, start, len, "lock")) {
                lua_pushboolean (L, 1);
                return 1;
        } else {
                lua_pushnil (L);
                lua_pushfstring (L, "%s", strerror(errno));
                return 2;
        }
}


/*
** Unlocks a file.
** @param #1 File handle.
** @param #2 Number with start position (optional).
** @param #3 Number with length (optional).
*/
static int file_unlock (lua_State *L) {
        FILE *fh = check_file (L, 1, "unlock");
        const long start = (long) luaL_optinteger (L, 2, 0);
        long len = (long) luaL_optinteger (L, 3, 0);
        if (_file_lock (L, fh, "u", start, len, "unlock")) {
                lua_pushboolean (L, 1);
                return 1;
        } else {
                lua_pushnil (L);
                lua_pushfstring (L, "%s", strerror(errno));
                return 2;
        }
}


/*
** Creates a link.
** @param #1 Object to link to.
** @param #2 Name of link.
** @param #3 True if link is symbolic (optional).
*/
static int make_link (lua_State *L) {
#ifndef _WIN32
  const char *oldpath = luaL_checkstring(L, 1);
  const char *newpath = luaL_checkstring(L, 2);
  int res = (lua_toboolean(L,3) ? symlink : link)(oldpath, newpath);
  if (res == -1) {
    return pusherror(L, NULL);
  } else {
    lua_pushinteger(L, 0);
    return 1;
  }
#else
  errno = ENOSYS; /* = "Function not implemented" */
  return pushresult(L, -1, "make_link is not supported on Windows");
#endif
}


/*
** Creates a directory.
** @param #1 Directory path.
*/
static int make_dir (lua_State *L) {
  const char *path = luaL_checkstring(L, 1);
  return pushresult(L, lfs_mkdir(path), NULL);
}


/*
** Removes a directory.
** @param #1 Directory path.
*/
static int remove_dir (lua_State *L) {
  const char *path = luaL_checkstring(L, 1);
  return pushresult(L, rmdir(path), NULL);
}


/*
** Directory iterator
*/
static int dir_iter (lua_State *L) {
#ifdef _WIN32
        struct _finddata_t c_file;
#else
        struct dirent *entry;
#endif
        dir_data *d = (dir_data *)luaL_checkudata (L, 1, DIR_METATABLE);
        luaL_argcheck (L, d->closed == 0, 1, "closed directory");
#ifdef _WIN32
        if (d->hFile == 0L) { /* first entry */
                if ((d->hFile = _findfirst (d->pattern, &c_file)) == -1L) {
                        lua_pushnil (L);
                        lua_pushstring (L, strerror (errno));
                        d->closed = 1;
                        return 2;
                } else {
                        lua_pushstring (L, c_file.name);
                        return 1;
                }
        } else { /* next entry */
                if (_findnext (d->hFile, &c_file) == -1L) {
                        /* no more entries => close directory */
                        _findclose (d->hFile);
                        d->closed = 1;
                        return 0;
                } else {
                        lua_pushstring (L, c_file.name);
                        return 1;
                }
        }
#else
        if ((entry = readdir (d->dir)) != NULL) {
                lua_pushstring (L, entry->d_name);
                return 1;
        } else {
                /* no more entries => close directory */
                closedir (d->dir);
                d->closed = 1;
                return 0;
        }
#endif
}


/*
** Closes directory iterators
*/
static int dir_close (lua_State *L) {
        dir_data *d = (dir_data *)lua_touserdata (L, 1);
#ifdef _WIN32
        if (!d->closed && d->hFile) {
                _findclose (d->hFile);
        }
#else
        if (!d->closed && d->dir) {
                closedir (d->dir);
        }
#endif
        d->closed = 1;
        return 0;
}


/*
** Factory of directory iterators
*/
static int dir_iter_factory (lua_State *L) {
        const char *path = luaL_checkstring (L, 1);
        dir_data *d;
        lua_pushcfunction (L, dir_iter);
        d = (dir_data *) lua_newuserdata (L, sizeof(dir_data));
        luaL_getmetatable (L, DIR_METATABLE);
        lua_setmetatable (L, -2);
        d->closed = 0;
#ifdef _WIN32
        d->hFile = 0L;
        if (strlen(path) > MAX_PATH-2)
          luaL_error (L, "path too long: %s", path);
        else
          sprintf (d->pattern, "%s/*", path);
#else
        d->dir = opendir (path);
        if (d->dir == NULL)
          luaL_error (L, "cannot open %s: %s", path, strerror (errno));
#endif
        return 2;
}


/*
** Creates directory metatable.
*/
static int dir_create_meta (lua_State *L) {
        luaL_newmetatable (L, DIR_METATABLE);

        /* Method table */
        lua_newtable(L);
        lua_pushcfunction (L, dir_iter);
        lua_setfield(L, -2, "next");
        lua_pushcfunction (L, dir_close);
        lua_setfield(L, -2, "close");

        /* Metamethods */
        lua_setfield(L, -2, "__index");
        lua_pushcfunction (L, dir_close);
        lua_setfield (L, -2, "__gc");
        return 1;
}


/*
** Creates lock metatable.
*/
static int lock_create_meta (lua_State *L) {
        luaL_newmetatable (L, LOCK_METATABLE);

        /* Method table */
        lua_newtable(L);
        lua_pushcfunction(L, lfs_unlock_dir);
        lua_setfield(L, -2, "free");

        /* Metamethods */
        lua_setfield(L, -2, "__index");
        lua_pushcfunction(L, lfs_unlock_dir);
        lua_setfield(L, -2, "__gc");
        return 1;
}


#ifdef _WIN32
 #ifndef S_ISDIR
   #define S_ISDIR(mode)  (mode&_S_IFDIR)
 #endif
 #ifndef S_ISREG
   #define S_ISREG(mode)  (mode&_S_IFREG)
 #endif
 #ifndef S_ISLNK
   #define S_ISLNK(mode)  (0)
 #endif
 #ifndef S_ISSOCK
   #define S_ISSOCK(mode)  (0)
 #endif
 #ifndef S_ISFIFO
   #define S_ISFIFO(mode)  (0)
 #endif
 #ifndef S_ISCHR
   #define S_ISCHR(mode)  (mode&_S_IFCHR)
 #endif
 #ifndef S_ISBLK
   #define S_ISBLK(mode)  (0)
 #endif
#endif
/*
** Convert the inode protection mode to a string.
*/
#ifdef _WIN32
static const char *mode2string (unsigned short mode) {
#else
static const char *mode2string (mode_t mode) {
#endif
  if ( S_ISREG(mode) )
    return "file";
  else if ( S_ISDIR(mode) )
    return "directory";
  else if ( S_ISLNK(mode) )
        return "link";
  else if ( S_ISSOCK(mode) )
    return "socket";
  else if ( S_ISFIFO(mode) )
        return "named pipe";
  else if ( S_ISCHR(mode) )
        return "char device";
  else if ( S_ISBLK(mode) )
        return "block device";
  else
        return "other";
}


/*
** Set access time and modification values for a file.
** @param #1 File path.
** @param #2 Access time in seconds, current time is used if missing.
** @param #3 Modification time in seconds, access time is used if missing.
*/
static int file_utime (lua_State *L) {
  const char *file = luaL_checkstring(L, 1);
  struct utimbuf utb, *buf;

  if (lua_gettop (L) == 1) /* set to current date/time */
    buf = NULL;
  else {
    utb.actime = (time_t) luaL_optnumber(L, 2, 0);
    utb.modtime = (time_t) luaL_optinteger(L, 3, utb.actime);
    buf = &utb;
  }

  return pushresult(L, utime(file, buf), NULL);
}


/* inode protection mode */
static void push_st_mode (lua_State *L, STAT_STRUCT *info) {
        lua_pushstring (L, mode2string (info->st_mode));
}
/* device inode resides on */
static void push_st_dev (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer) info->st_dev);
}
/* inode's number */
static void push_st_ino (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer) info->st_ino);
}
/* number of hard links to the file */
static void push_st_nlink (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer)info->st_nlink);
}
/* user-id of owner */
static void push_st_uid (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer)info->st_uid);
}
/* group-id of owner */
static void push_st_gid (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer)info->st_gid);
}
/* device type, for special file inode */
static void push_st_rdev (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer) info->st_rdev);
}
/* time of last access */
static void push_st_atime (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer) info->st_atime);
}
/* time of last data modification */
static void push_st_mtime (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer) info->st_mtime);
}
/* time of last file status change */
static void push_st_ctime (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer) info->st_ctime);
}
/* file size, in bytes */
static void push_st_size (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer)info->st_size);
}
#ifndef _WIN32
/* blocks allocated for file */
static void push_st_blocks (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer)info->st_blocks);
}
/* optimal file system I/O blocksize */
static void push_st_blksize (lua_State *L, STAT_STRUCT *info) {
        lua_pushinteger (L, (lua_Integer)info->st_blksize);
}
#endif

 /*
** Convert the inode protection mode to a permission list.
*/

#ifdef _WIN32
static const char *perm2string (unsigned short mode) {
  static char perms[10] = "---------";
  int i;
  for (i=0;i<9;i++) perms[i]='-';
  if (mode  & _S_IREAD)
   { perms[0] = 'r'; perms[3] = 'r'; perms[6] = 'r'; }
  if (mode  & _S_IWRITE)
   { perms[1] = 'w'; perms[4] = 'w'; perms[7] = 'w'; }
  if (mode  & _S_IEXEC)
   { perms[2] = 'x'; perms[5] = 'x'; perms[8] = 'x'; }
  return perms;
}
#else
static const char *perm2string (mode_t mode) {
  static char perms[10] = "---------";
  int i;
  for (i=0;i<9;i++) perms[i]='-';
  if (mode & S_IRUSR) perms[0] = 'r';
  if (mode & S_IWUSR) perms[1] = 'w';
  if (mode & S_IXUSR) perms[2] = 'x';
  if (mode & S_IRGRP) perms[3] = 'r';
  if (mode & S_IWGRP) perms[4] = 'w';
  if (mode & S_IXGRP) perms[5] = 'x';
  if (mode & S_IROTH) perms[6] = 'r';
  if (mode & S_IWOTH) perms[7] = 'w';
  if (mode & S_IXOTH) perms[8] = 'x';
  return perms;
}
#endif

/* permssions string */
static void push_st_perm (lua_State *L, STAT_STRUCT *info) {
    lua_pushstring (L, perm2string (info->st_mode));
}

typedef void (*_push_function) (lua_State *L, STAT_STRUCT *info);

struct _stat_members {
        const char *name;
        _push_function push;
};

struct _stat_members members[] = {
        { "mode",         push_st_mode },
        { "dev",          push_st_dev },
        { "ino",          push_st_ino },
        { "nlink",        push_st_nlink },
        { "uid",          push_st_uid },
        { "gid",          push_st_gid },
        { "rdev",         push_st_rdev },
        { "access",       push_st_atime },
        { "modification", push_st_mtime },
        { "change",       push_st_ctime },
        { "size",         push_st_size },
        { "permissions",  push_st_perm },
#ifndef _WIN32
        { "blocks",       push_st_blocks },
        { "blksize",      push_st_blksize },
#endif
        { NULL, NULL }
};

/*
** Get file or symbolic link information
*/
static int _file_info_ (lua_State *L, int (*st)(const char*, STAT_STRUCT*)) {
        STAT_STRUCT info;
        const char *file = luaL_checkstring (L, 1);
        int i;

        if (st(file, &info)) {
                lua_pushnil(L);
                lua_pushfstring(L, "cannot obtain information from file '%s': %s", file, strerror(errno));
                lua_pushinteger(L, errno);
                return 3;
        }
        if (lua_isstring (L, 2)) {
                const char *member = lua_tostring (L, 2);
                for (i = 0; members[i].name; i++) {
                        if (strcmp(members[i].name, member) == 0) {
                                /* push member value and return */
                                members[i].push (L, &info);
                                return 1;
                        }
                }
                /* member not found */
                return luaL_error(L, "invalid attribute name '%s'", member);
        }
        /* creates a table if none is given, removes extra arguments */
        lua_settop(L, 2);
        if (!lua_istable (L, 2)) {
                lua_newtable (L);
        }
        /* stores all members in table on top of the stack */
        for (i = 0; members[i].name; i++) {
                lua_pushstring (L, members[i].name);
                members[i].push (L, &info);
                lua_rawset (L, -3);
        }
        return 1;
}


/*
** Get file information using stat.
*/
static int file_info (lua_State *L) {
        return _file_info_ (L, STAT_FUNC);
}


/*
** Push the symlink target to the top of the stack.
** Assumes the file name is at position 1 of the stack.
** Returns 1 if successful (with the target on top of the stack),
** 0 on failure (with stack unchanged, and errno set).
*/
static int push_link_target(lua_State *L) {
#ifdef _WIN32
        errno = ENOSYS;
        return 0;
#else
        const char *file = luaL_checkstring(L, 1);
        char *target = NULL;
        int tsize, size = 256; /* size = initial buffer capacity */
        while (1) {
            target = realloc(target, size);
            if (!target) /* failed to allocate */
                return 0;
            tsize = readlink(file, target, size);
            if (tsize < 0) { /* a readlink() error occurred */
                free(target);
                return 0;
            }
            if (tsize < size)
                break;
            /* possibly truncated readlink() result, double size and retry */
            size *= 2;
        }
        target[tsize] = '\0';
        lua_pushlstring(L, target, tsize);
        free(target);
        return 1;
#endif
}

/*
** Get symbolic link information using lstat.
*/
static int link_info (lua_State *L) {
        int ret;
        if (lua_isstring (L, 2) && (strcmp(lua_tostring(L, 2), "target") == 0)) {
                int ok = push_link_target(L);
                return ok ? 1 : pusherror(L, "could not obtain link target");
        }
        ret = _file_info_ (L, LSTAT_FUNC);
        if (ret == 1 && lua_type(L, -1) == LUA_TTABLE) {
                int ok = push_link_target(L);
                if (ok) {
                        lua_setfield(L, -2, "target");
                }
        }
        return ret;
}


/*
** Assumes the table is on top of the stack.
*/
static void set_info (lua_State *L) {
  lua_pushliteral(L, "Copyright (C) 2003-2017 Kepler Project");
  lua_setfield(L, -2, "_COPYRIGHT");
  lua_pushliteral(L, "LuaFileSystem is a Lua library developed to complement the set of functions related to file systems offered by the standard Lua distribution");
  lua_setfield(L, -2, "_DESCRIPTION");
  lua_pushliteral(L, "LuaFileSystem " LFS_VERSION);
  lua_setfield(L, -2, "_VERSION");
}


static const struct luaL_Reg fslib[] = {
        {"attributes", file_info},
        {"chdir", change_dir},
        {"currentdir", get_dir},
        {"dir", dir_iter_factory},
        {"link", make_link},
        {"lock", file_lock},
        {"mkdir", make_dir},
        {"rmdir", remove_dir},
        {"symlinkattributes", link_info},
        {"setmode", lfs_f_setmode},
        {"touch", file_utime},
        {"unlock", file_unlock},
        {"lock_dir", lfs_lock_dir},
        {NULL, NULL},
};

LUAMOD_API int luaopen_lfs (lua_State *L) {
        dir_create_meta (L);
        lock_create_meta (L);
        new_lib (L, fslib);
        lua_pushvalue(L, -1);
        lua_setglobal(L, LFS_LIBNAME);
        set_info (L);
        return 1;
}

#define SMALL_CHUNK 256

/* compatibility with old module system */
#if defined(LUA_COMPAT_MODULE)
static int findtable (lua_State *L) {
  if (lua_gettop(L)==1){
    lua_pushglobaltable(L);
    lua_insert(L, 1);
  }
  luaL_checktype(L, 1, LUA_TTABLE);
  const char *name = luaL_checklstring(L, 2, 0);
  lua_pushstring(L, luaL_findtable(L, 1, name, 0));
  return 2;
}
#endif

static const luaL_Reg base_funcs[] = {
  {"assert", luaB_assert},
  {"collectgarbage", luaB_collectgarbage},
  {"dofile", luaB_dofile},
  {"error", luaB_error},
#if defined(LUA_COMPAT_MODULE)
  {"findtable", findtable},
#endif
  {"getmetatable", luaB_getmetatable},
  {"ipairs", luaB_ipairs},
  {"loadfile", luaB_loadfile},
  {"load", luaB_load},
#if defined(LUA_COMPAT_LOADSTRING)
  {"loadstring", luaB_loadstring},
#endif
  {"next", luaB_next},
  {"pairs", luaB_pairs},
  {"pcall", luaB_pcall},
  {"print", luaB_print},
  {"rawequal", luaB_rawequal},
  {"rawlen", luaB_rawlen},
  {"rawget", luaB_rawget},
  {"rawset", luaB_rawset},
  {"select", luaB_select},
  {"setmetatable", luaB_setmetatable},
  {"setmetamethod", luaB_setmetamethod},
  {"tointeger", luaB_tointeger},
  {"tonumber", luaB_tonumber},
  {"tostring", luaB_tostring},
  {"type", luaB_type},
  {"xpcall", luaB_xpcall},
  /* placeholders */
  {"_G", NULL},
  {"_VERSION", NULL},
  {NULL, NULL}
};


LUAMOD_API int luaopen_base (lua_State *L) {
  /* open lib into global table */
  lua_pushglobaltable(L);
  luaL_setfuncs(L, base_funcs, 0);
  /* set global _G */
  lua_pushvalue(L, -1);
  lua_setfield(L, -2, "_G");
  /* set global _VERSION */
  lua_pushliteral(L, LUA_VERSION);
  lua_setfield(L, -2, "_VERSION");
  return 1;
}

