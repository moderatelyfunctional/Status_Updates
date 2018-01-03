
# Whale
Whale is a macOS menu bar utility for getting updates on your favorite Facebook pages.

## Installation
Coming soon!

## Usage
First, you need to obtain your Facebook API access key. Once you do, open the preferences to enter your Facebook API access key, then click on 'Set'.

To add a new Facebook page, click on '+' at the bottom of pane. Click on the 'Page ID' cell to enter the page ID and press the enter key. 

For example, if the page link is https://www.facebook.com/beaverconfessions/, then the page ID is 'beaverconfessions'.

You will see the page name under 'Title' and the response status from Facebook API under 'Status'. The status code is 200 if there's no problem, 401 if your access is unauthorized, and 404 if the page is not found. 

To remove a Facebook page, click on the row you want to remove, then click on '-' at the bottom of pane.

Click on 'Done' to save your changes and exit the preferences. <i>Do NOT exit by clicking on the red exit button on the left top corner of pane. It will not save your changes.</i>

Click on 'Refresh' to fetch the latest updates from your favorite pages. You will see how many likes the pages have, how many posts they have published in the last 24 hours, and when their most recent posts were published.

## Obtaining Facebook API access key

1. Go to https://developers.facebook.com/ and select My Apps > Add a New App.

2. Enter a display name for this app and your email address. Click on 'Create App ID'.

3. Select 'Dashboard'.

4. Take notes of your 'App ID' and 'App Secret'.

5. Type https://graph.facebook.com/oauth/access_token?client_id={YOUR_APP_ID}&client_secret={YOUR_APP_SECRET}&grant_type=client_credentials into your browser's address bar, replacing {YOUR_APP_ID} and {YOUR_APP_SECRET} with keys from step 4. It will display your Facebook API access key.
