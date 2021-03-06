+++
title = "External protocols"
date = 2020-04-08T13:40:13+12:00
draft = "False"
categories = [ 
	"IT", 
	"Technology"
	]
+++

I have been trying to get org-protcol-capture working, so I can have a
bookmark in Chrome that will send/save the details to an org-mode file
(well, my inbox.org).


So far so good, but every time I fire the bookmark, Chrome stops and
asks me if I really want to do that. But I've found a fix.

At https://cloud.google.com/docs/chrome-enterprise/policies/?policy=ExternalProtocolDialogShowAlwaysOpenCheckbox there are details of a registry entry that can be tweaked, so one can permanently accept such protocol calls.

```
Show an "Always open" checkbox in external protocol dialog.

Supported on: Google Chrome (Linux, Mac, Windows) since version 79

Description: This policy controls whether or not the "Always open"
             checkbox is shown on external protocol launch confirmation 
             prompts.

If this policy is set to True, when an external protocol confirmation
is shown, the user may choose to "Always open" the protocol without
future confirmation prompts.

If this policy is set to False or not set, the "Always open" checkbox
is not displayed and the user will be prompted each time an external
protocol is invoked.

Supported features:
Dynamic Policy Refresh: No
Per Profile: Yes

Data type: Boolean
Windows:REG_DWORD

Windows registry location: Software\Policies\Google\Chrome\ExternalProtocolDialogShowAlwaysOpenCheckbox

Example value (Windows): 0x00000001

```

I had to create everything from Google onwards in the registry.

FYI entering 0x00000001 in the regedit, is done as 01 00 00 00
