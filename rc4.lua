#!/usr/bin/env luajit
-- @fannheyward

local ffi           = require 'ffi'
local ffi_new       = ffi.new
local ffi_str       = ffi.string
local C             = ffi.C
local setmetatable  = setmetatable
local error         = error

local _M = { _VERSION = 0.1 }

ffi.cdef[[
    typedef struct rc4_key_st
    {
        unsigned int x,y;
        unsigned int data[256];
    } RC4_KEY;

    void RC4_set_key(RC4_KEY *key, int len, const unsigned char *data);
    void RC4(RC4_KEY *key, size_t len, const unsigned char *indata, unsigned char *outdata);
]]

function _M.crypt(plaintext, key)
    if not plaintext or #plaintext < 0 or not key or #key < 0 then
        return nil
    end

    local ciphertext = ffi_new("unsigned char[?]", #plaintext)
    local rc4_key = ffi_new(ffi.typeof("RC4_KEY[1]"))

    C.RC4_set_key(rc4_key, #key, key)
    C.RC4(rc4_key, #plaintext, plaintext, ciphertext)

    return ffi_str(ciphertext, #plaintext)
end

return _M

