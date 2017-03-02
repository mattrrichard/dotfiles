
(defconst visual-basic-packages
  '(
    (visual-basic-mode :location local)
    ))

(defun visual-basic-narrow-to-function ()
  "Narrow to Function"
  (interactive)
  (save-excursion
    (let ((beg (re-search-backward "^Function\\|^Sub")))
      (re-search-forward "^End Function\\|^End Sub")
      (end-of-line)
      (narrow-to-region beg (point)))))

(defun visual-basic/init-visual-basic-mode ()
  (use-package visual-basic-mode
    :defer t
    :mode ("\\.bas\\'\\|\\.frm\\'\\|\\.cls\\'\\|\\.tm\\'" . visual-basic-mode)
    :config (progn
              (spacemacs/declare-prefix-for-mode 'visual-basic-mode "mn" "narrow")

              (spacemacs/set-leader-keys-for-major-mode 'visual-basic-mode
                "nf" 'visual-basic-narrow-to-function))))
