RC4 bindings for LuaJIT with FFI.

```
local rc4 = require 'rc4'

local encryption_text = rc4.crypt('origin_plain_text', 'encryption_key')
local decryption_text = rc4.crypt(encryption_text, encryption_key)
```

