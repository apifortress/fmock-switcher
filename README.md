# fmock-switcher
## A plugin that replaces the upstream URL for the Kong API Gateway
The objective of this plugin is to allow Kong to switch from one upstream URL to another, based on a client-driven trigger.
The purpose is to allow a consumer to decide whether it needs to be served by the origin server or a mock of the service
hence the name of the plugin.

### Configuration keys
* replacement_url (**url**): the upstream URL that should work as a replacement for the upstream URL, when triggered
* header_name (**string**): the header whose presence in the request will trigger the change of the upstream URL
