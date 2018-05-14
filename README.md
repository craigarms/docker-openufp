# docker-openufp
docker container automatied build for openufp

# Build
docker build https://github.com/craigarms/docker-openufp.git#openufp -t craigarms/openufp:latest

# Run
Usage: docker run craigarms/openufp:latest [OPTIONS] <-n|-w> <BACKEND>

Example: docker run craigarms/openufp:latest -n -p '192.168.1.10:3128:Access Denied.' -F
Example: docker run craigarms/openufp:latest -n -f blacklist -p '192.168.1.10:3128:Access Denied.' -F
Example: docker run craigarms/openufp:latest -C http://www.test.com\n -F

OPTIONS:
   -l PORT   on which port openufp will listen for incoming requests
   -r URL    when url is denied the client will be redirected to this url; n2h2 only
   -c SECS   cache expire time in seconds; default 3600; 0 disables caching
   -C URL    remove specified URL from cache
   -d LEVEL  debug level 1-3
   -F        run in foreground, don't fork main process

FRONTEND:
   -n        act as n2h2 server
   -w        act as websense server

BACKEND:
   -p IP:PORT:DENY_PATTERN   use the proxy backend
             IP is the ipnumber of the proxy server
             PORT is the portnumber where the proxy server is listening on
             DENY_PATTERN is a piece of text that should match the deny page
   -f FILE   use the blacklist file backend
             FILE is a file which contains blacklisted urls
   -g        use the squidGuard backend\n

NOTE:
   The default location of the cache db is /var/cache/openufp/cache.db.
   When squidguard backend is used be sure that this program has rw permissions
   to the squidguard db files.\n

Version: 1.10
