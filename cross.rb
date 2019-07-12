use_debug false
use_bpm 120

kick_volume = 1
rel = 0.1
rel_odds = 10

live_loop :kick_sub do
 sample :bd_tek, cutoff: 50
  sleep 1
end

live_loop :kick, delay: 3.875 do
 sample :bd_tek, cutoff: 40
   sleep 4
 end

sleep 0.5

live_loop :k_hh do
  with_fx :lpf, cutoff: 120 do
    with_fx :echo, phase: 0.75, decay: 4, pre_mix: 0.3 do

      # sample :drum_cymbal_soft, 
      #     attack: 0.01, 
      #     sustain: 0.01, 
      #     release: 0.1, ## range 0.01-0.5
      #     amp: 0.1
      #   sleep 0.25

    end
  end
end

live_loop :amen_break, delay: -1.5 do
  sync :kick_sub
    #0 do
     with_fx :lpf, cutoff: 60 do
      sample :loop_amen, beat_stretch: 4, cutoff: 100, amp: 0.2
      sleep 1
    #end
  end
end



#####lpf min 40 max 130
live_loop :play, delay: -1 do
    sync :kick_sub
      with_fx :lpf, cutoff: 50 do
        use_synth :fm
        play 75, pan: -1, release: rel
        sleep 0.5
       with_fx :reverb, room: 4, damp: 0.6, mix: 0.8  do
          play 72, pan: 1, release: rel
          play 79, pan: -1, release: (rel * rel_odds)
        sleep 0.5
      end
      play 75, pan: 1, release: rel
        sleep 1
        play 72, pan: -1, release: (rel * rel_odds)
        sleep 1
  end
end


# live_loop :piano_s do
#   sync :kick_sub
#   with_fx :echo, phase: 0.75, decay: 4, pre_mix: 1 do
#     with_fx :lpf, cutoff: 130 do
#       use_synth :dark_ambience
#       play 75, pan: 1.6, release: (rel *3)
#       sleep 1
#         play 72, pan: -1.6, release: (rel *3)
#         play 79, pan: 1.6, release: (rel)
#       sleep 2
#     end
#   end
# end