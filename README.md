# hassio-addons
Repository of custom addons for hass.io

## Inadyn

### About

Inadyn is a small and simple Dynamic DNS, DDNS, client with HTTPS support. Commonly available in many GNU/Linux distributions, used in off the shelf routers and Internet gateways to automate the task of keeping your Internet name in sync with your public IP address.

### This Hass.io Addon

The objective is to provide a client to do dynamic dns updates on behalf of your hass.io server. The configuration of this addon allows you to setup your provider to dynamically update whenever a change of your public IP address occurs.

### Configuration

The available configuration options are as follows (this is filled in with some example data):

```
{
  "providers": [
    {
      "provider": "providerslug",
      "username": "yourusername",
      "password": "yourpassword_or_token",
      "hostname": "dynamic-subdomain.example.com",
      "ssl": true,
      "user_agent": "Mozilla/5.0",
      "checkip_ssl": false,
      "checkip_server": "api.example.com",
      "checkip_command": "/sbin/ifconfig eth0 | grep 'inet6 addr'",
      "checkip_path": "/",
      "custom_provider": false,
      "ddns_server": "ddns.example.com",
      "ddns_path": ""
    }
  ]
}
```

You should not fill in all of these, only use what is necessary. A typical example would look like:

```
{
    {
      "provider": "duckdns",
      "username": "your-token",
      "hostname": "sub.duckdns.org"
    }
  ]
}
```

or:

```
{
  "providers": [
    {
      "provider": "someprovider",
      "username": "username",
      "password": "password",
      "hostname": "your.domain.com"
    }
  ]
}
```

for a custom provider that is not supported by inadyn you can do:
```
{
  "providers": [
    {
      "provider": "arbitraryname",
      "username": "username",
      "password": "password",
      "hostname": "your.domain.com",
      "ddns_server": "api.cp.easydns.com",
      "ddns_path": "/dyn/generic.php?hostname=%h&myip=%i",
      "custom_provider": true
    }
  ]
}
```

the tokens in ddns_path are outlined in the `inadyn.conf(5)` man page.