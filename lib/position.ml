(** Abstraction Function: The position [pos] represents a coordinate in the
    positive x,y plane. [pos.x] is the x coordinate and [pos.y] is the y
    coordinate. Representation Invariant: x and y values are non-negative.*)

type position = {
  x : int;
  y : int;
}

type direction = {
  len : int;
  step : position;
}

let origin = { x = 0; y = 0 }
let invalid = { x = -1; y = -1 }
let make_position x y = { x; y }

let is_valid position =
  0 <= position.x && position.x < 8 && 0 <= position.y && position.y < 8

let move direction position =
  { x = position.x + direction.x; y = position.y + direction.y }

let move_by_row ?(len = 1) ?(max = Int.max_int) position =
  {
    x = (position.x + len) mod max;
    y = position.y + ((position.x + len) / max);
  }

let direction ?(len = 1) x y = { len; step = { x; y } }

let to_string position =
  Printf.sprintf "%c%d" (Char.chr (Char.code 'a' + position.x)) (position.y + 1)
