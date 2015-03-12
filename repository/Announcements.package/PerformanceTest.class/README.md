I am a performance test for the AXAnnouncements package.
I compare the package to TriggerEvents like Vassili Bykov did on his blog. http://www.cincomsmalltalk.com/userblogs/vbykov/blogView?showComments=true&entry=3311592662

Results on a P4@3.2 (took about 10 minutes):

<N> TriggerEvent AXAnnouncements Ratio   
0   517          738             0.701   
1   855          1059            0.807   
3   3170         1428            2.22    
10  7984         2925            2.73    
30  22004        6717            3.276   
100 71300        19030           3.747 

The table becomes fancy if you copy it to a place where the characters' width is fixed.

To perform the test yourself, print it:
AXPerformanceTest run

I also spam the Transcript with my messages. 
Beware, performing the test takes minutes.

You might play with the numbers in #testValues. They represent the number of subscriptions.