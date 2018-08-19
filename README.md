# Upstream-replace
## A plugin that replaces the upstream URL for the Kong API Gateway
The objective of this plugin is to allow Kong to switch from one upstream URL to another, based on a client-driven trigger.

### Configuration keys
* `replacement_url` (**url**): the upstream URL that should work as a replacement for the upstream URL, when triggered;
* `header_name` (**string**): the header whose presence in the request will trigger the change of the upstream URL.

### Compatibility and interactions
* The plugin has been developed against **Kong 0.14**.
