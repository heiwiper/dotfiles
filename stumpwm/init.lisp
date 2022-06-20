;; -*- mode: lisp; mode: stumpwm -*-

(in-package :stumpwm)

(load-module "battery-portable")

(run-shell-command "sh ~/.xprofile")

(run-shell-command "flameshot &")
(run-shell-command "nextcloud &")
(run-shell-command "kdeconnect-indicator &")
(run-shell-command "nm-applet &")
(run-shell-command "blueman-applet &")

(mode-line)
(setf stumpwm:*window-format* "%m%n%s%c")
(setf stumpwm:*screen-mode-line-format*
	(list "[%B] -- [ %D] -- %w -- "
	      '(:eval (stumpwm:run-shell-command "date" t))))

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

