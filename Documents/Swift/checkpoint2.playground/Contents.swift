// CHECKPOINT 2 - COMPLEX DATA TYPES
// print total days and total unique days

import Cocoa

var days: [String] = ["monday" , "tuesday" , "friday" , "saturday" , "tuesday"]
print(days.count)

var uniqueDays = Set<String>(days)
print(uniqueDays.count)
