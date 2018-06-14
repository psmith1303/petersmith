+++
slug = "automating-hugo-part2"
draft = "False"
categories = [
  "Productivity",
  "IT",
  "Technology",
]
date = "2016-11-21T20:45:44+13:00"
title = "Automating Hugo part 2"
+++

So, this is the code that I am using to automate writing blog posts. My default is to write a blog post, then---if necessary---move it to be a journal entry, or whatever.

The elisp code in my init.el looks like this:

```
    (setq hugo-base-dir "~/NAS/Programming/Websites-source/petersmith/"
        hugo-buffer "*hugo*")

    (defun hugo-new-post ()
      (interactive)
      (let* ((title (read-from-minibuffer "Title: "))
             (filename (concat "blog/" 
                               (read-from-minibuffer "Filename: "
                                                     (replace-regexp-in-string "-\\.md" ".md"
                                                       (concat (today-is) (downcase
                                                                (replace-regexp-in-string "[^a-z0-9]+" "-"
                                                                                          title))
                                                               ".md")))))
             (path (concat hugo-base-dir "content/" filename)))
        (if (file-exists-p path)
            (message "File already exists!")
              (hugo-command "new" filename)
          (find-file path)
          (hugo-replace-key "title" title)
          (goto-char (point-max))
                (save-buffer))))

    (defun today-is ()
      (format-time-string "%Y%m%d-"))

    (defun hugo-command (&rest args)
      (let ((default-directory (expand-file-name hugo-base-dir)))
        (apply 'call-process "hugo" nil hugo-buffer t args)))

    (defun hugo-replace-key (key val)
      (save-excursion
        (goto-char (point-min))
        ; quoted value
        (if (and (re-search-forward (concat key " = \"") nil t)
                   (re-search-forward "[^\"]+" (line-end-position) t))
            (or (replace-match val) t) ; ensure we return t
          ; unquoted value
          (when (and (re-search-forward (concat key " = ") nil t)
                     (re-search-forward ".+" (line-end-position) t))
            (or (replace-match val) t)))))

    (defun hugo-publish ()
      (interactive)
      (let* ((default-directory (concat (expand-file-name hugo-base-dir) "/")))
        (when (call-process "bash" nil hugo-buffer t  "./Scripts/deploySite.sh")
          (message "Blog published"))))
```

Now if only I could get pygments to work.
