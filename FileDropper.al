controladdin FileDropper
{
    StartupScript = 'js/start.js';
    RequestedHeight = 0;
    RequestedWidth = 0;
    event OnReady();
    event OnDrop(filename: Text; file: Text);
}