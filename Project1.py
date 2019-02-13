
from random import randint

class Player:
    def __init__(self, *placements):
        self.placements = placements
        self.resource_card_count = 0

    def check_placements(self, roll):
        for place in self.placements:
            if roll in place:
                self.collect_resource()

    def collect_resource(self):
        self.resource_card_count += 1

    def print_resource_count(self):
        print(self.resource_card_count)


class Game:
    def __init__(self, turns, *players):
        self.turns = turns
        self.players = players

    def roll_dice(self):
        roll = randint(1,6) + randint(1,6)
        return roll
    
    def turn(self):
        roll = self.roll_dice()
        for player in self.players:
            player.check_placements(roll)

    def play(self):
        for _ in range(self.turns):
            self.turn()
        

def play_n_games(number):
    player1_total_count = []
    player2_total_count = []
    for _ in range(number):
        player1 = Player([8,5,10], [8,3,4])
        player2 = Player([6,9,3], [5,10,4])

        game = Game(40, player1, player2)
        game.play()

        player1_total_count.append(player1.resource_card_count)
        player2_total_count.append(player2.resource_card_count)

    print('Player1:', *player1_total_count)
    print('Player2:', *player2_total_count)
    print('Player1 Total:', sum(player1_total_count))
    print('Player2 Total:', sum(player2_total_count))



if __name__ == "__main__":
    play_n_games(100)
