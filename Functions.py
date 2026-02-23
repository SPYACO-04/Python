# def reed(name,city):
#     print("Good Mornig",name)
#     print("Hello",city)
#     print("Bye")
# for i in range (2):
#     reed("suraj","mumbai")
#     reed("rahul" , "here")


# def add(a, b):
#     # print(a + b)
#     return a + b

# c = add(3, 4)
# print(c)

def he(name="user", city = "Mumbai"):
    print("Hello",name, city)
    
he()  #Hello user
he("suraj", )    #Hello suraj
he(city="BAM", name="Amit")

add = lambda a,b:a + b
print(add(4,5))