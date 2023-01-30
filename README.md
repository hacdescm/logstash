## Patched file

Update the following under `lib/webhdfs/client_v1.rb`

```diff
      gsscli = nil
      if @kerberos
        require 'base64'
        require 'gssapi'
+       conn.use_ssl = true
        gsscli = GSSAPI::Simple.new(@host, 'HTTP', @kerberos_keytab)
        token = nil
```
