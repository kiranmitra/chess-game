open OUnit2
open Test_position
open Test_matrix
open Test_game

let all_tests =
  "all tests"
  >::: [
         king_tests_special;
         valid_move_tests;
         game_player_moves;
         position_tests;
         square_matrix_tests;
       ]

(* This code is automatically run. *)
let _ = run_test_tt_main all_tests
