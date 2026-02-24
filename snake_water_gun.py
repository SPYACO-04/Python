import random

def game_win(user, computer):
    if user == computer:
        return None
    
    #snake vs water
    if user == "s" and computer == "w":
        return True
    if user == "w" and computer == "s":
        return False

    #water vs gun
    if user == "w" and computer == "g":
        return True
    if user == "gg" and computer == "w":
        return False

    #gun vs snake
    if user == "g" and computer == "s":
        return True
    if user == "s" and computer == "g":
        return False


rand_no = random.randint(1, 3)

print("Computers Turn : Snake(s), Water(w), Gun(G)")
if rand_no == 1:
    computer = "s"
elif rand_no == 2:
    computer = "w"
else:
    computer = "g"

user = input("Your turn (Snake(s), water(w), Gun(G)) :").lower()

result = game_win(user, computer)  #Return true if you win, False for lose, none for draw
print(f"\nYou chose :{user}")
print(f"\nyou chose : {computer}")

if result is None:
    print("\nIts a draw!")
elif(result):
    print("\nyou win!")
else:
    print("\nYou Lose!")