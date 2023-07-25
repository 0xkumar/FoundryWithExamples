#### 4.IMPORTS

This example is all about
1. forge remappings
2. forge install rari-capital/solmate (installing libraries)
3. forge update lib/solmate (updating libraries )
4. forge remove solmate (removing libraries that already installed)


#### 5.Forge fmt

This example is all about 
1. forge fmt (This command will format the code to look good and change to the clear and formatted manner)

#### 6. conmsole.log

1. console.log() is the command used to print on the terminal

#### 7. Testing Authentication

1. vm.startPrank() (It is the alternative for vm.prank() and it its starts to prank as the address given in the prenthesis and all the code after the vm.startPrank will be executed with the address given in the parenthesis )

2. vm.stopPrank() (It is the ending point of the vm.startPrank() after this command the pranked address is no longer be used to call)



#### 8. Testing Errors

1. vm.expectRevert (This is used to tell foundry that the next upcoming expression is going to fail)

2. vm.expectRevert(bytes("errorMessage ")) (This is used to test the error message in the revert statement)
   
3. vm.expectRevert(Error. custom error used in the source code.selector) (This is used to check the custom errors )
   
#### 9.Testing Events

1. To Test the Event we should follow the following steps
    1. Tell the foundry which data to check
    2. Emit the expected event
    1. call the function that should emit the event

2. vm.expectEmit() (This is useful to specify the topics to check by giving the bool in the parenthesis of a vm.expectEmit)


#### 10. Testing Time

1. vm.warp (set the block.timestamp to future timestamp)
2. vm.roll (set block number)
3. skip (increment current timestamp)
4. rewind (decrement current timestamp)

