# Objective-C MRC: Double Release Crash in Setter

This repository demonstrates a subtle bug in Objective-C's manual reference counting (MRC) that can lead to a crash due to double release.  The issue occurs within a setter method when dealing with nil values.

## Bug Description

A double release crash occurs when setting a property to nil in a setter method without properly handling the case where the property is already nil. 

## How to Reproduce

1. Clone this repository.
2. Compile and run `bug.m`.
3. Observe the crash.

## Solution

The solution involves adding a nil check before releasing the existing object in the setter method to prevent a double release.

See `bugSolution.m` for the corrected code.