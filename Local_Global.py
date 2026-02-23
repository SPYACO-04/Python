# def show_value():
#     x = 11  #Local Variable
#     print(x)

# show_value()  #11
# x=32  #Global Variable
# show_value()  #11


x = 78  #Local Variable
def show():
    # global x  #It change the value of local value 23 into 78
    x = 23
    print(x)
    
show()  #23
print(x)  #78