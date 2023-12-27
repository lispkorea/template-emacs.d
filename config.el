;; file: config.el

(require 'cl-lib)
(require 'cl-seq)

(defalias '-> 'thread-first)
(defalias '->> 'thread-last)

(cl-defstruct ConfigInfo
  index
  file-path
  file-fullpath
  time-load-sec)

(defun getConfigInfos (config-dir config-list)
  (cl-loop for index from 0
           for file-path in config-list
           collect
           (let* ((file-fullpath (->> file-path
                                      (symbol-name)
                                      (concat config-dir)
                                      (locate-user-emacs-file)
                                      (file-truename)))
                  (time-load-sec (-> file-fullpath
                                     (load-file)
                                     (benchmark-run)
                                     (car))))
             (make-ConfigInfo :index (+ index 1)
                              :file-path file-path
                              :file-fullpath file-fullpath
                              :time-load-sec time-load-sec))))

(defun config:load-config (config-dir config-list)
  (let* ((infos (getConfigInfos config-dir config-list))
         (acc-sec (->> infos
                       (mapcar #'ConfigInfo-time-load-sec)
                       (apply '+ ))))
    (let ((buff (get-buffer-create "== 설정 로드 결과 ==")))
      (with-current-buffer buff
        (view-mode -1)
        (erase-buffer)
        (insert (format "\n\n총 %d파일, %0.4f초\n\n" (length infos) acc-sec))
        (dolist (info infos)
          (insert (format "%03d | %0.3f초 | %s\n"
                          (ConfigInfo-index info)
                          (ConfigInfo-time-load-sec info)
                          (ConfigInfo-file-fullpath info))))
        (switch-to-buffer buff)
        (view-mode +1)))))
