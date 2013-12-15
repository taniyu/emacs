quickrun.el
==================

Introduction
------------
**quickrun.el** is emacs version of [quickrun.vim](https://github.com/thinca/vim-quickrun).


`quickrun.el` is a extension to execute editing buffer.
`quickrun.el` is similar to executable-interpret, but `quickrun.el` provides more convenient
commands. `quickrun.el` execute not only script languages(Perl, Ruby, Python etc), but also
compiling languages(C, C++, Go, Java etc).


Requirements
------------
Emacs 22.1 or higher.

I usually test `quickrun.el` with Emacs 24.


Installation
------------

You can install `quickrun.el` from [MELPA](http://melpa.milkbox.net/) with package.el.

Or install directly:

    $ cd load-path-dir
    $ wget https://raw.github.com/syohex/emacs-quickrun/master/quickrun.el

After Installation add following to your configuration file(~/.emacs.d/init.el, ~/.emacs etc)

    (require 'quickrun)


Basic Usage
-----------

Execute current buffer. If `quickrun.el` does not find command-key,
then `quickrun.el` asks you command-key.

    M-x quickrun

Execute current buffer with specified command.
`quickrun.el` asks you command-key.

    C-u M-x quickrun

Execute region. (Java is not supported)

    M-x quickrun-region

Execute current buffer with arguments.
`quickrun.el` asks you command line argument

    M-x quickrun-with-arg

Execute current buffer in eshell for interactive command such as program
which reads input from STDIN.

    M-x quickrun-shell

Compile current buffer with compile.el framework, not execute.
quickrun with C-u C-u prefix behaves same as quickrun-compile-only.

    M-x quickrun-compile-only

`M-x quickrun` with anything interaface

    M-x anything-quickrun

`M-x quickrun` with helm interaface

    M-x helm-quickrun

Support Programming Languages
-----------------------------
`quickrun.el` supports following programming languages and markup languages
as default. But you can register your own command and apply other languages.

**Programming Language(commands used)**

* C(gcc or clang or Visual C++)
* C++(g++ or clang++ or Visual C++)
* Objective-C(gcc -objc)
* D Language(dmd)
* Fortran(gfortran)
* Java(javac and java)
* Perl(perl)
* Ruby(ruby)
* Python(python)
* PHP(php)
* Emacs Lisp(emacs)
* Scheme(gosh)
* Common Lisp(clisp or sbcl or ccl)
* Clojure(jark or clj-env-dir)
* Javascript(node or v8 or js or jrunscript or cscript)
* Coffee Script(coffee)
* JSX(jsx)
* Markdown(Markdown.pl or bluecloth or kramdown or pandoc or redcarpet)
* Haskell(runghc)
* Go Language(go or gccgo)
* Io(io)
* Lua(lua)
* Groovy(groovy)
* Scala(scala) *Please use UTF-8 encoding*
* HAML(haml)
* SASS(sass)
* LESS(lessc)
* Erlang(escript)
* Ocaml(ocamlc)
* ShellScript(sheban's shell)
* AWK(awk)
* Rust(rustc)
* Dart(dart)
* Elixir(elixir)
* TypeScript(tsc)


See also `quickrun/support-languages` global variable.


User Defined Command
--------------------
`quickrun-add-command` define new command.

```` elisp
(quickrun-add-command "c++/c11"
                      '((:command . "g++")
                        (:exec    . ("%c -std=c++0x %o -o %e %s"
                                     "%e %a"))
                        (:remove  . ("%e")))
                      :default "c++")

(quickrun-add-command "pod"
                      '((:command . "perldoc")
                        (:exec    . "%c -T -F %s"))
                      :mode 'pod-mode)

;; You can override existing command
(quickrun-add-command "c/gcc"
                      '((:exec . ("%c -std=c++0x %o -o %e %s"
                                  "%e %a")))
                       :override t)
````

quickrun-add-command has key parameters, ':default', ':mode'.

* `:default` parameter overwrites command-key used of default support language.

`:default "c++"` means that quickrun uses this command to C++ files as default.

* `:mode` parameter means that which major-mode use this command-key.

`:mode 'pod-mode` means that quickrun uses this command when major-mode is pod-mode.

* Override existing command if `:override` parameter is true


Add new Language setting
------------------------
Alist of **filename patterns** vs corresponding **command-key**.

    (quickrun-add-command "prove" '((:command . "prove") (:exec . "%c -bv %s")))
    (add-to-list 'quickrun-file-alist '("\\.t$" . "prove"))


If file name is matched to regexp "\\.t$", then quickrun.el uses "prove"
command set for that file. `quickrun-file-alist` is a higher priority
to select command-key than major-mode.


quickrun-file-alist is similar to `auto-mode-alist`, car of list is
regexp, cdr of list is "command-key".


Change Default Command
----------------------
`quickrun-set-default` changes default command in some language.

    (quickrun-set-default "c" "c/clang")


This means that quickrun uses "c/clang" command in C files.


Timeout Second
--------------
`quickrun.el` makes program kill 10 seconds later as default,
for avoiding infinite loop. You can change this value through
*quickrun-timeout-seconds*. If this variable is set negative integer,
time-out does not occur.


File Local Variables
--------------------
File local variables is priority to other parameter.

    quickrun-option-cmd-alist

Command alist.

    quickrun-option-command

String expanded to %c.

    quickrun-option-cmdkey

Command key

    quickrun-option-cmdopt

String expanded to %o

    quickrun-option-args

String expanded to %a.

    quickrun-option-shebang

If this value is not 0, and first line of source file is stated "#!",
the following string is treated as ":command".

    quickrun-option-outputter

Outputter function.


User Defined Command with file local variables
----------------------------
`quickrun.el` has some file local variable.

For example, C11 C++ program file.

    #include <iostream>
    #include <vector>
    #include <string>

    int main (int argc, char *argv[])
    {
        std::vector <std::string> lst = { "a", "b", "c", "d" };

        for (auto x : lst){
            std::cout << "[" << x << "]" << std::endl;
        }

        for (auto i = 1; i < argc; i++){
            std::cout << "[" << argv[i] << "]" << std::endl;
        }

        return 0;
    }

    /*
      Local Variables:
      quickrun-option-cmd-alist: ((:command . "g++")
                                  (:exec    . ("%c -std=c++0x -o %n %s"
                                               "%n apple orange melon"))
                                  (:remove  . ("%n")))
      End:
    */

In this case, quickrun compiles this file with following command
(source file is /home/bob/sample/sample.cpp)

    g++ -std=c++0x -o /home/bob/sample/sample /home/bob/sample/sample.cpp

And quickrun execute with command.

    /home/bob/sample/sample apple orange melon


Hooks
-----

Run hooks after execute all commands.

    quickrun-after-run-hook


Command-Alist
-------------
Command alist has ':command', ':exec', ':remove', ':outputter', ':description'
parameters.

:command

`:command` paramter is mandatory parameter.

:execute

Execute command templates. This parameter can take list.
If you set list parameter, `quickrun.el` executes command
list in order.

If this parameter is omitted, `quickrun.el` use default execute
command template "%c %o %s %a".

:remove

Remove files after executing.
If command create some intermediate files, you should set this
parameter. :remove value is atom or list.

:outputter

Please see Outputter section.

:default-directory

Directory where commands are executed.

:description

Description of this command. This parameter is used in
`anything-quickrun` or `helm-quickrun`


Format of Command-Alist
-----------------------
You can use following placeholders in command-alist.

| Placeholder | Result                                        |
|:-----------:|:----------------------------------------------|
|  %c         |  Command                                      |
|  %o         |  Command line option                          |
|  %s         |  Source(absolute path)                        |
|  %a         |  Script's argumetns                           |
|  %n         |  Source without extension(absolute path)      |
|  %N         |  Source without extension(nondirectory)       |
|  %d         |  Directory name of Source(absolute path)      |
|  %e         |  Source with executable suffix(absolute path) |
|  %E         |  Source with executable suffix(nondirectory)  |


`quickrun.el` copys source file to temporary file firstly,
so name of source file is at random.


Outputter
---------
Outputter is a function for processing output buffer, enable some major-mode,
output other buffer or file, open it with browser etc. Default outputter is
to output to \*quickrun\* buffer and processing ANSI Color sequence.

`quickrun.el` defines following functions as default.

* buffer:buffername

Output to buffer. [outputter *buffer* sample](emacs-quickrun/tree/master/sample/sample_outputter_buffer.pl)

* file:filename

Output to file. [outputter *file* sample](emacs-quickrun/tree/master/sample/sample_outputter_file.pl)

* variable:varname

Output to variable. [outputter *variable* sample](emacs-quickrun/tree/master/sample/sample_outputter_variable.pl)

* browser

Output to Web browser(using function *browse-url*) [outputter *browser* sample](emacs-quickrun/tree/master/sample/sample_outputter_browser.pl)

* message

Output to \*Message\* buffer(using function *message*) [outputter *message* sample](emacs-quickrun/tree/master/sample/sample_outputter_message.pl)

* multi

Use multiple outputters.  [outputter *multi* sample](emacs-quickrun/tree/master/sample/sample_outputter_multi.pl)

* null

No output. [outputter *null* sample](emacs-quickrun/tree/master/sample/sample_outputter_null.pl)


Using quickrun as function from other functions
-----------------------------------------------
`quickrun' can be used as function from other functions.
You can pass configuration by `:source` argument.
Sample is following:

```` elisp
(defun test-perl ()
  (interactive)
  (let* ((cmd "git rev-parse --show-toplevel")
         (topdir (with-temp-buffer
                   (call-process-shell-command cmd nil t nil)
                   (goto-char (point-min))
                   (if (re-search-forward "^\\(.+\\)$" nil t)
                       (match-string 1)))))
    (quickrun :source `((:command . "prove")
                        (:default-directory . ,topdir)
                        (:exec . ("%c -bv --color %s"))))))
````
