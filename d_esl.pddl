(define (domain esl)
  (:requirements :strips)
  (:types 
          helicopter
          location
          injured
          crane
  )


  (:predicates 
               ;; depot
               (is-depot ?x - location)

               ;; what is this crane x ?
               (is-food ?x - crane) (is-medecine ?x - crane) (is-water ?x - crane) 
               
               ;; injured x need a crate ? 
               (need-food ?x - injured) (need-medecine ?x - injured) (need-water ?x - injured) 

               ;; injured x is as location y OR helicopter x is at location y  OR crate x is at as location y
               (is-at-h ?x - helicopter ?y - location)
               (is-at-c ?c - crane ?y -location )
               (is-at-i ?i - injured ?y -location )

               ;; helicopter x has a crate ?
               (is-empty ?x - helicopter)

               ;; helicopter carry this crane ?
               (carry-crane ?h - helicopter ?c - crane)
  ) 

  (:action PickUpCrane
    :parameters (?h - helicopter ?c - crane ?l - location)
    :precondition (and 
                      (is-depot ?l) 
                      (is-at-h ?h ?l) (is-at-c ?c ?l)
                      (is-empty ?h) 
                  )
    :effect (and 
                (not (is-empty ?h)) (not (is-at-c ?c ?l)) (carry-crane ?h ?c)
            )
  ) 

  (:action FlyTo
    :parameters (?h - helicopter ?l1 - location ?l2 - location)
    :precondition (and 
                      (is-at-h ?h ?l1) (not (is-at-h ?h ?l2))
                  )
    :effect (and 
                (not (is-at-h ?h ?l1)) (is-at-h ?h ?l2) 
            )
  ) 

  (:action DeliverCrane
    :parameters (?h - helicopter ?c - crane ?l - location ?i - injured)
    :precondition (and 
                      (not (is-depot ?l))
                      (is-at-h ?h ?l) (is-at-i ?i ?l) 
                      (not (is-empty ?h))
                      (carry-crane ?h ?c)
                  )
    :effect (and 
                (is-empty ?h)
                (is-at-c ?c ?l)
                (not (carry-crane ?h ?c))
                (when (is-food ?c) (not (need-food ?i)) )
                (when (is-medecine ?c) (not (need-medecine ?i)) )
                (when (is-water ?c) (not (need-water ?i)) )
            )
  ) 

)

