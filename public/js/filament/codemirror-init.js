document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll('.codemirror').forEach(function (el) {
        CodeMirror.fromTextArea(el, {
            mode: "application/json",
            theme: "monokai",
            lineNumbers: true,
            autoRefresh: true
        });
    });
});
