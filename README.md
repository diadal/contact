<p align="center"><br><img src="https://user-images.githubusercontent.com/236501/85893648-1c92e880-b7a8-11ea-926d-95355b8175c7.png" width="128" height="128" /></p>

<h3 align="center">Contacts</h3>
<p align="center"><strong><code>@diadal/contact</code></strong></p>
<p align="center">
  Capacitor3 plugin for fetching contacts.
</p>

<p align="center">
  <img src="https://img.shields.io/maintenance/yes/2021?style=flat-square" />
  <a href="https://github.com/diadal/contact/actions?query=workflow%3A%22Test+and+Build+Plugin%22"><img src="https://img.shields.io/github/workflow/status/diadal/contact/Test%20and%20Build%20Plugin?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@diadal/contact"><img src="https://img.shields.io/npm/l/@diadal/contact?style=flat-square" /></a>
<br>
  <a href="https://www.npmjs.com/package/@diadal/contact"><img src="https://img.shields.io/npm/dw/@diadal/contact?style=flat-square" /></a>
  <a href="https://www.npmjs.com/package/@diadal/contact"><img src="https://img.shields.io/npm/v/@diadal/contact?style=flat-square" /></a>



## Prerequisites

Setup your project with Capacitor. For details check here: https://capacitorjs.com

```
cd my-app
npm install --save @capacitor/core @capacitor/cli
```

Initalize Capacitor

```
npx cap init
```

Add the platforms you want to use.

```
npx cap add android
npx cap add ios
npx cap add electron
```

## Installation

Install:

```
npm i --save @diadal/contact
```

Sync:

```
npx cap sync
```

### iOS

For iOS you need to set a usage description in your info.plist file. (Privacy Setting)
Open xCode search for your info.plist file and press the tiny "+". Add the following entry:

```
Privacy - Contacts Usage Description
```

Give it a value like:

```
"We need access to your contacts in order to do something."
```

### Android Notes

For Android you have to add the permisions in your AndroidManifest.xml. Add the following permissions before the closing of the "manifest" tag.

```
<uses-permission android:name="android.permission.READ_CONTACTS" />
<uses-permission android:name="android.permission.WRITE_CONTACTS"/>
```

Next import the capContacts class to your MainActivity

```
// Initializes the Bridge
    this.init(savedInstanceState, new ArrayList<Class<? extends Plugin>>() {{
      // Additional plugins you've installed go here
      // Ex: add(TotallyAwesomePlugin.class);
      add(Contacts.class);
    }});
```

Make sure to import it properly as well.

```
import ng.diadal.capacitor.contacts.Contacts;
```

**NOTE**: On Android you have to ask for permission first, before you can fetch the contacts. Use the `getPermissions()` method before you try to fetch contacts using `getContacts()`.

## Usage / Examples

You have the following Methods available:

```
export interface ContactsPlugin {
  getPermissions(): Promise<PermissionStatus>;
  getContacts(): Promise<{contacts: Contact[]}>;
}
```

If you're considering to use this plugin you most likely want to retrive contacts a users contacts:

Import the Plugin in your TS file:

```
import { Plugins } from "@capacitor/core";
const  { Contacts } = Plugins;
```

Next use it and console log the result:

```
Contacts.getContacts().then(result => {
    console.log(result);
    for (const contact of result.contacts) {
        console.log(contact);
    }
});

```

That's it. Do Whatever you want with the retrived contacts.

If you're trying to build something like "contacts matching" based on phone numbers i recommend using google libphonenumber: https://www.npmjs.com/package/google-libphonenumber

In order to match them properly you need to format them before you can match or store them properly.

### Interfaces

```
export interface PermissionStatus {
  granted: boolean;
}

export interface Contact {
  contactId: string;
  displayName?: string;
  phoneNumbers: PhoneNumber[];
  emails: EmailAddress[];
  photoThumbnail?: string;
  organizationName?: string;
  organizationRole?: string;
  birthday?: string;
}

export interface PhoneNumber {
  label?: string;
  number?: string;
}

export interface EmailAddress {
  label?: string;
  address?: string;
}
```

## Built With

- Swift 5
- Java
- Angular
- Capacitor

## Authors

- Diadal ([diadal](https://github.com/diadal))

## License

MIT



## API

<docgen-index>

* [`getPermissions()`](#getpermissions)
* [`getContacts()`](#getcontacts)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### getPermissions()

```typescript
getPermissions() => Promise<PermissionStatus>
```

**Returns:** <code>Promise&lt;<a href="#permissionstatus">PermissionStatus</a>&gt;</code>

--------------------


### getContacts()

```typescript
getContacts() => Promise<{ contacts: Contact[]; }>
```

**Returns:** <code>Promise&lt;{ contacts: Contact[]; }&gt;</code>

--------------------


### Interfaces


#### PermissionStatus

| Prop          | Type                 |
| ------------- | -------------------- |
| **`granted`** | <code>boolean</code> |


#### Contact

| Prop                   | Type                        |
| ---------------------- | --------------------------- |
| **`contactId`**        | <code>string</code>         |
| **`displayName`**      | <code>string</code>         |
| **`phoneNumbers`**     | <code>PhoneNumber[]</code>  |
| **`emails`**           | <code>EmailAddress[]</code> |
| **`photoThumbnail`**   | <code>string</code>         |
| **`organizationName`** | <code>string</code>         |
| **`organizationRole`** | <code>string</code>         |
| **`birthday`**         | <code>string</code>         |


#### PhoneNumber

| Prop         | Type                |
| ------------ | ------------------- |
| **`label`**  | <code>string</code> |
| **`number`** | <code>string</code> |


#### EmailAddress

| Prop          | Type                |
| ------------- | ------------------- |
| **`label`**   | <code>string</code> |
| **`address`** | <code>string</code> |

</docgen-api>
