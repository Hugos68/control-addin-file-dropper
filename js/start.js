// Hide the control add-in
window.frameElement.parentElement.style.display = "none";

// Grab dropzone
const dropzone = window.frameElement.parentElement.parentElement.querySelector(
  ".ms-nav-grid-horizontal-container.ms-nav-grid-container"
);

// Add event listeners
dropzone.addEventListener("dragover", (e) => {
  e.preventDefault();
});
dropzone.addEventListener("drop", (e) => {
  e.preventDefault();
  const files = e.dataTransfer.files;
  if (!files.length === 0) {
    return;
  }
  for (const file of files) {
    const reader = new FileReader();
    reader.onload = (e) => {
      Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnDrop", [
        file.name,
        e.target.result,
      ]);
    };
    reader.readAsDataURL(file);
  }
});

// Notify that the control add-in is ready
Microsoft.Dynamics.NAV.InvokeExtensibilityMethod("OnReady");
