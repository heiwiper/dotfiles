;; -*- mode: lisp; mode: stumpwm -*-

(in-package :stumpwm)

(load-module "battery-portable")

(run-shell-command "sh ~/.xprofile")

(set-prefix-key (kbd "F20"))

(defvar *my-media-keymap*
  (let ((m (make-sparse-keymap)))
    (define-key *top-map* (kbd "XF86AudioRaiseVolume")
      "exec amixer -q sset Master 10%+")
    (define-key *top-map* (kbd "XF86AudioLowerVolume")
      "exec amixer -q sset Master 10%-")
    (define-key *top-map* (kbd "XF86AudioMute")
      "exec amixer -q sset Master 1+ toggle")
    (define-key *top-map* (kbd "XF86AudioMicMute")
      "exec amixer -q sset Capture 1+ toggle")
    (define-key *top-map* (kbd "XF86MonBrightnessUp")
      "exec light -A 10")
    (define-key *top-map* (kbd "XF86MonBrightnessDown")
      "exec light -U 10")))

(mode-line)
(setf stumpwm:*screen-mode-line-format*
      (list "[%B] | [%n] | %w | "
	    '(:eval (stumpwm:run-shell-command "date" t))))
