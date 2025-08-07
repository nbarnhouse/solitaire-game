// utils/deck.js
//This file creates and shuffles the deck
const suits = ["hearts", "diamonds", "clubs", "spades"];
const ranks = [
  "A",
  "2",
  "3",
  "4",
  "5",
  "6",
  "7",
  "8",
  "9",
  "10",
  "J",
  "Q",
  "K",
];

export function createDeck() {
  const deck = [];

  for (let suit of suits) {
    for (let rank of ranks) {
      deck.push({
        id: `${rank}-of-${suit}`,
        suit,
        rank,
        faceUp: false,
      });
    }
  }

  return shuffle(deck);
}

function shuffle(deck) {
  return [...deck].sort(() => Math.random() - 0.5);
}
