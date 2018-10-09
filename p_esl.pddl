(define (problem 1rp-1i-1f-1m-1w) 
  (:domain esl)
  (:objects 
      d - location
      
      ;; rescue points
      rp1 - location 
      rp2 - location 

      ;; helicopters
      h1 - helicopter
      h2 - helicopter

      ;; injureds
      i1 - injured
      i2 - injured
      i3 - injured

      ;; crates (food, medecine, water)
      f1 f2 f3 - crane
      m1 m2 m3 - crane
      w1 w2 w3 - crane
  )

  (:init 
      ;; static
      (is-depot d)

      (is-at-h h1 d)
      (is-at-h h2 d)

      (is-empty h1) 
      (is-empty h2) 

      ;; dynamic
      
      ;; crates
      (is-food f1)
      (is-food f2)
      (is-food f3)
      (is-medecine m1)
      (is-medecine m2)
      (is-medecine m3)
      (is-water w1)
      (is-water w2)
      (is-water w3)

      (is-at-c f1 d)
      (is-at-c f2 d)
      (is-at-c f3 d)
      (is-at-c m1 d)
      (is-at-c m2 d)
      (is-at-c m3 d)
      (is-at-c w1 d)
      (is-at-c w2 d)
      (is-at-c w3 d)

      ;; injureds
      (is-at-i i1 rp1)
      (is-at-i i2 rp1)
      (is-at-i i3 rp2)

      (need-food i1)
      (need-medecine i1)
      (need-water i1)

      (need-food i2)
      (need-medecine i2)
      (need-water i2)

      (need-food i3)
      (need-medecine i3)
      (need-water i3)

  )

  (:goal (and 
              (not (need-food i1))
              (not (need-medecine i1))
              (not (need-water i1))

              (not (need-food i2))
              (not (need-medecine i2))
              (not (need-water i2))

              (not (need-food i3))
              (not (need-medecine i3))
              (not (need-water i3))
         )
  )


)
