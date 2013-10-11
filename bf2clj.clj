;; #!/usr/bin/env clj
;; convert from Clojure to Brainfuck
(defn stdin []
  (line-seq
  (java.io.BufferedReader. *in* )))

(def pointer 0)

(defn init-print []
  (println "

(def pointer 0)

(defn memoryname [] (str \"m\" pointer))

(defn get-value-from-memory []
  (eval (symbol (memoryname))))

(defn inc-pointer
  [] (def pointer (+ pointer 1)))

(defn dec-pointer
  [] (def pointer (- pointer 1)))

(defn set-memory? []
  (boolean (resolve (symbol (memoryname)))))

(defn set-or-zero []
    (if (set-memory?) (get-value-from-memory) 0))


(defn set-pointer [set-value]
  (intern *ns* (symbol (memoryname)) set-value))

(defn inc-memory [] (set-pointer (+ (set-or-zero) 1)))
(defn dec-memory [] (set-pointer (- (set-or-zero) 1)))

"))

(defn clojurefuck
  [token]
  (do
      (cond
   (= token \[) (println "
((fn []
     (loop []
       (if (> (set-or-zero) 0) (do ")
   (= token \]) (println "(recur)) nil))))")
   (= token \+) (println "(inc-memory)")
   (= token \-) (println "(dec-memory)")
   (= token \>) (println "(inc-pointer)")
   (= token \<) (println "(dec-pointer)")
   (= token \.) (println "(print (char (set-or-zero)))")))
  )

(init-print)
(doall
 (map clojurefuck (str (stdin))))
