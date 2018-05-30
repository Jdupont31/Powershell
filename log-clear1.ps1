function clear-all-event-logs ($computerName="localhost")
{
   $logs = get-eventlog -computername $computername -list | foreach {$_.Log}
   $logs | foreach {clear-eventlog -comp $computername -log $_ }
   get-eventlog -computername $computername -list
}

clear-all-event-logs -comp *****