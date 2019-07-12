

# with_fx :reverb, mix: 0.2 do
#   loop do
#     play scale(:Eb2, :major_pentatonic, num_octaves: 3).choose, release: 0.1, amp: rand
#     sleep 0.1
#   end
# end

with_fx :reverb, mix: 0.8 do
  loop do
    play scale(:C3, :minor_pentatonic, num_octaves: 3).choose, release: 0.1, amp: rand
    sleep 0.1
  end
end


live_loop :guit do
  with_fx :slicer, mix: 0.3, phase: 1 do
    # with_fx :wobble, pulse_width: 0.9, smooth: 20 do
    #  use_synth :piano     
      play :Eb2
      sleep 1
    end
  end



live_loop :k_hh do
  with_fx :lpf, cutoff: 100 do
   sample :bd_haus, rate: 1
    sleep 0.25
  end
  with_fx :hpf, cutoff: 100 do
  #  with_fx :echo, phase: 0.25, premix: 0.01 do
      sample :drum_cymbal_soft, 
        attack: 0.01, 
        sustain: 0.1, 
        release: 0.1
      sleep 0.25
   # end
  end
end


live_loop :amen_break do
    use_bpm 60
    with_fx :slicer, phase: 0.5, wave: 0.26, mix: 1 do
   #   sample :loop_amen, beat_stretch: 2, cutoff: 100
    end
    sleep 2
end

#live_loop :boom
