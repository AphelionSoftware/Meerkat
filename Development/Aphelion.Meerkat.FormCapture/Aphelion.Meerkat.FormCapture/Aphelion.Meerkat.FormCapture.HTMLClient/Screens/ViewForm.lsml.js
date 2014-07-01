/// <reference path="../GeneratedArtifacts/viewModel.js" />
// Fowler/Noll/Vo hashing.
function fnv_1a(v) {
    var n = v.length,
        a = 2166136261,
        c,
        d,
        i = -1;
    while (++i < n) {
        c = v.charCodeAt(i);
        if (d = c & 0xff000000) {
            a ^= d >> 24;
            a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
        }
        if (d = c & 0xff0000) {
            a ^= d >> 16;
            a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
        }
        if (d = c & 0xff00) {
            a ^= d >> 8;
            a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
        }
        a ^= c & 0xff;
        a += (a << 1) + (a << 4) + (a << 7) + (a << 8) + (a << 24);
    }
    // From http://home.comcast.net/~bretm/hash/6.html
    a += a << 13;
    a ^= a >> 7;
    a += a << 3;
    a ^= a >> 17;
    a += a << 5;
    return a & 0xffffffff;
}

myapp.ViewForm.Categories1_ItemTap_execute = function (screen) {
    // Write code here.
    try {
        myapp.activeDataWorkspace.MeerkatData.saveChanges();
        myapp.applyChanges().then(
            function () {
                myapp.showViewCategory(screen.Categories.selectedItem,screen.Form.isConfidential,screen.FNV1a, 
                    {
                        afterClosed: function (addEditScreen, navigationAction) {
                            // If the user commits the change,
                            // Save
                            if (navigationAction === msls.NavigateBackAction.commit) {
                                myapp.activeDataWorkspace.MeerkatData.saveChanges();
                                myapp.applyChanges();
                            }
                        }
                }


                    );
                
            }
            );

        }
    catch (ValidationException) {
        //this.ShowMessageBox("Please correct data entry errors and try to save again.");
        var x = 1;
    }
};
myapp.ViewForm.created = function (screen) {
    // Write code here.
    var guid = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });

    screen.FNV1a = fnv_1a(guid);
};