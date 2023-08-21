var capacitorContacts = (function (exports, core) {
    'use strict';

    const Contacts$1 = core.registerPlugin('Contacts', {
        web: () => Promise.resolve().then(function () { return web; }).then(m => new m.ContactsPluginWeb()),
    });

    class ContactsPluginWeb extends core.WebPlugin {
        constructor() {
            super({
                name: "CapContacts",
                platforms: ["web"],
            });
        }
        async getPermissions() {
            throw new Error("getPermission not available");
        }
        async getContacts() {
            throw new Error("getContacts not available");
        }
    }
    const Contacts = new ContactsPluginWeb();

    var web = /*#__PURE__*/Object.freeze({
        __proto__: null,
        Contacts: Contacts,
        ContactsPluginWeb: ContactsPluginWeb
    });

    exports.Contacts = Contacts$1;

    return exports;

})({}, capacitorExports);
//# sourceMappingURL=plugin.js.map
