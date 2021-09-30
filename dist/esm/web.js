import { WebPlugin } from "@capacitor/core";
export class ContactsPluginWeb extends WebPlugin {
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
export { Contacts };
//# sourceMappingURL=web.js.map