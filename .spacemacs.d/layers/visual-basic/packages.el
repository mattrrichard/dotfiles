
(defconst visual-basic-packages
  '(
    (visual-basic-mode :location local)
    ))

(defun visual-basic/init-visual-basic-mode()
  (use-package visual-basic-mode
    :defer t
    :mode ("\\.bas\\'\\|\\.frm\\'\\|\\.cls\\'" . visual-basic-mode)
    )
  )
