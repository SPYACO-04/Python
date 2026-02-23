a = " \nHow are you Suraj !"

# a = "\nI am fine !"

# file = open("Suraj.txt","w") # for write
# file = open("Suraj.txt","a") #for append
# file.write(a)
# file.close()


# file = open("sdf.txt", "r")
# # cont = file.read()
# cont = file.readlines()
# print(cont)

# file.close()


with open("Suraj.txt", "a") as f:
    f.write(a)