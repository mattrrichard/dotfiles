;;; packages.el --- duotone-theme Layer packages File for Spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq duotone-theme-packages
      '(
        (duotone-theme :location local)
        ))

;; List of packages to exclude.
(setq duotone-theme-excluded-packages '())

(defun duotone-theme/init-duotone-theme()
  ;; This feels like a hack. If you're reading this
  ;; (which, wtf how did you get here?) and you know
  ;; what the hell I did wrong, please let me know!
  (require 'duotone-theme-autoloads)
  )
