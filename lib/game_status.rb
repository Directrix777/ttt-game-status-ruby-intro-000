# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Top to bottom diagonal
  [6,4,2]  # Bottom to top diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    spot_1 = board[combo[0]]
    spot_2 = board[combo[1]]
    spot_3 = board[combo[2]]

    if (spot_1 == "X" && spot_2 == "X" && spot_3 == "X") || (spot_1 == "O" && spot_2 == "O" && spot_3 == "O")
      return combo
    end
  end
  false
end

def full?(board)
  index = 0
  until index == 9
    if !position_taken?(board, index)
      return false
    end
    index += 1
  end
  true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  false
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    combo = won?(board)
    return board[combo[0]]
  end
end
