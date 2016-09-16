(require 'ox-publish)
(require 'ox-md)

(defcustom my-org-md-extension "md"
  "The extension for exported Markdown files."
  :group 'org-export-md
  :type 'string)

(defun my-org-publish-to-markdown (plist filename pub-dir)
  "Publish an org file to Markdown.

FILENAME is the filename of the Org file to be published.  PLIST
is the property list for the given project.  PUB-DIR is the
publishing directory.

Return output file name."
  (org-publish-org-to 'md filename
		      (concat "." (or (plist-get plist :my-md-extension)
				      my-org-md-extension "md"))
		      plist pub-dir))

(setq org-publish-use-timestamps-flag nil)

(setq org-publish-project-alist
      `(("html"
	 :base-directory "."
	 :base-extension "org"
	 :exclude "blurb"
	 :publishing-directory "."
	 :publishing-function org-html-publish-to-html)
	("pdf"
	 :base-directory "."
	 :base-extension "org"
	 :exclude "blurb\\|index\\|README"
	 :publishing-directory "."
	 :publishing-function org-latex-publish-to-pdf)
	("md"
	 :base-directory "."
	 :base-extension "org"
	 :exclude "blurb\\|define\\|index"
	 :publishing-directory "."
	 :publishing-function my-org-publish-to-markdown)
	("all" :components ("html" "md" "pdf"))))

(org-publish "all")
