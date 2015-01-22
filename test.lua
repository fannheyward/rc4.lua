#!/usr/bin/env luajit
-- /usr/local/openresty/bin/resty test.lua

local rc4 = require 'rc4'

local plain = [[ Velit quis dictum scelerisque, est lectus hendrerit lorem,
eget dignissim orci nisl sit amet massa. Etiam volutpat lobortis eros. Nunc ac
tellus in sapien molestie rhoncus. Pellentesque nisl. Praesent venenatis
blandit velit. Fusce rutrum. Cum sociis natoque penatibus et magnis dis
parturient montes, nascetur ridiculus mus. Pellentesque vitae erat. Vivamus
porttitor cursus lacus. Pellentesque tellus. Nunc aliquam interdum felis. Nulla
imperdiet leo. Mauris hendrerit, sem at mollis pharetra, leo sapien pretium
elit, a faucibus sapien dolor vel pede. Vestibulum et enim ut nulla
sollicitudin adipiscing. Suspendisse malesuada venenatis mauris. Curabitur
ornare mollis velit. Sed vitae metus. Morbi posuere mi id odio.]]

local cipher = rc4.crypt(plain, 'encryption_key')
local decryption = rc4.crypt(cipher, 'encryption_key')

print(decryption == plain)

