# SFTP with Docker-compose

Simple implementation of SFTP server (<https://github.com/atmoz/sftp>) using Docker Compose

## SSH key pair

Create the a SSH key pair which will be used by our SFTP container:

```sh
./generate_ssh_key_pair.sh
```

## Users

Create users.conf file

### Plain text

```txt
foo:123:1001:100
bar:abc:1002:100
baz:xyz:1003:100
```

### Encrypted

```txt
foo:$1$oc7STwA.$CyNcLjDQ0Oh8nLznURifv.:e:1001:100
bar:$1$ezqvUJEE$4c2r1HvoTMJ.Aw2tPp1Nw1:e:1002:100
baz:$1$bcRtbHbO$l0155yF6.lvaJxog3hS9D.:e:1003:100
```

## Password

Add `:e` behind password to mark it as encrypted.

### Option 1:

```sh
echo -n "your-password" | docker run -i --rm atmoz/makepasswd --crypt-md5 --clearfrom=- | awk '{print $2":e"}'
```

### Option 2:

```sh
docker run --rm python:alpine python -c "import crypt; print(crypt.crypt('YOUR_PASSWORD'))"
```

## References

- https://github.com/atmoz/sftp
- https://easyengine.io/handbook/configure-sftp-on-ee4-server/

