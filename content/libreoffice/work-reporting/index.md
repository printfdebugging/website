---
title: Work reporting and Time Management
date: 2024-12-24
draft: true
---

```bash
#!/bin/bash

# Replace with your actual mailbox.org username and password
USERNAME="<mail-id>"
PASSWORD="" # this must be managed by gpg/keyring etc, for that I need to understand those

# mailbox.org WebDAV URL for calendar access
CALENDAR_URL="https://dav.mailbox.org/caldav/<calendar-id>"

# Function to fetch all calendar events
fetch_all_calendar_events() {
    curl -u "$USERNAME:$PASSWORD" -X REPORT --data '<?xml version="1.0" encoding="UTF-8" ?>
    <c:calendar-query xmlns:d="DAV:" xmlns:c="urn:ietf:params:xml:ns:caldav">
        <d:prop>
            <d:getetag />
            <c:calendar-data />
        </d:prop>
        <c:filter>
            <c:comp-filter name="VCALENDAR">
                <c:comp-filter name="VEVENT" />
            </c:comp-filter>
        </c:filter>
    </c:calendar-query>' -H "Depth: 1" -H "Content-Type: application/xml" "$CALENDAR_URL"
}

# Fetch and display the calendar events
echo "Fetching all calendar events from mailbox.org..."
response=$(fetch_all_calendar_events)

# Parse the XML response and extract the event details using xmllint
event_details=$(echo "$response" | xmllint --format -)

# Display the event details
echo "Calendar Event Details:"
echo "$event_details" > out
```
