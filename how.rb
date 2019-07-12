use_debug false
use_bpm 120

htdw1 = "/Users/peterhencz/Desktop/code/spi_sample/w1"
htdw2 = "/Users/peterhencz/Desktop/code/spi_sample/w2"
htdw3 = "/Users/peterhencz/Desktop/code/spi_sample/w3"

# live_loop :kick_sub, delay: 32 do
#   sample :bd_tek, cutoff: 50, amp: 4
#   sample :bd_tek, cutoff: 90, amp: 4
#    sleep 1
#  end

# live_loop :htdw1 do
#   sample htdw1, onset: 3, attack: 0.4, release: 0.01
#   sample htdw1, onset: 1, attack: 0.7, release: 0.1
#   sleep 4
# end

live_loop :htdw2 do
  with_fx :echo, phase: 0.75, decay: 4, pre_mix: 0.3 do
  sample htdw2, onset: 5, attack: 0.4, release: 0.1
  sample htdw2, onset: 4, attack: 0.7, release: 0.1
  sleep 4
  end
end

# live_loop :htdw2_a, delay: 8 do
#   sleep 3
#   sample htdw2, onset: 14, attack: 0.7, release: 0.71
#   sleep 1
# end

live_loop :htdw3_a, delay: 8 do
  sample htdw3, cutoff: 100, attack: 1, release: 0.7
  sleep 8
end

live_loop :htdw2_b, delay: 8 do
  sleep 0.25
  sample htdw2, onset: 40, attack: 0.7, release: 1
  sleep 0.5
  sample htdw2, onset: 27, attack: 0.07, release: 0.41
  sleep 0.25
  sample htdw2, onset: 30, attack: 0.05, release: 1
  sleep 0.5
  sample htdw2, onset: 48, attack: 0.7, release: 0.51
  sleep 2.5
end

# live_loop :htdw2_2 do
#   sleep 7.25
#   sample htdw2, onset: 34, attack: 0.007, release: 1
# end

 live_loop :k_hh, delay: 16 do
  with_fx :lpf, cutoff: 120 do
    with_fx :echo, phase: 0.75, decay: 4, pre_mix: 0.3 do
      sample :drum_cymbal_soft, 
          attack: 0.01, 
          sustain: 0.01, 
          release: 0.1, ## range 0.01-0.5
          pan: rrand(-0.3, 0.3),
          amp: 0.5
        sleep 0.25
    end
  end
end

live_loop :s_amen, delay: 4 do
  with_fx :echo, phase: 0.5, decay: 2 do
    sleep 1
    sample :loop_amen, 
      onset: 1, 
      sustain: 0.1, 
      release: 0.01, 
      amp: 0.2
    sleep 0.5
    sample :loop_amen, 
      onset: 4, 
      sustain: 0.1, 
      release: 0.1,
      amp: 0.2
    sleep 0.5
    sample :loop_amen, 
      onset: 2, 
      sustain: 0.1, 
      release: 0.3,
      amp: 0.2
    sleep 0.5
    sample :loop_amen, 
      onset: rrand(1, 4), 
      sustain: 1, 
      release: 0.1,
      amp: 0.1
    sleep 0.25
    sample :loop_amen, onset: rrand(1, 4), sustain: 0.4, release: 0.4
    sleep 1.25
  end
end
