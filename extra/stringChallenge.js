const tagsRegex = /<(\/?)(\bdiv|i|p\b)>/g;
const openTagRegex = /<(\bdiv|i|p\b)>/g;
const str =
  "<div><i>hello world</i><div>hello world</div>how </div><div></div>";

function StringChallenge(str) {
  const htmlTags = str.match(tagsRegex);
  // this array stores a list or open tags.
  // Please note that it is mutable.
  const listOfOpenTags = [];

  for (let i = 0; i < htmlTags.length; i++) {
    if (htmlTags[i].match(openTagRegex)) {
      const openTag = htmlTags[i].replace(/<|>/g, "");
      // i had to make this array mutable to store the current
      // list of open tags.
      listOfOpenTags.push(openTag);
    } else {
      const closingTag = htmlTags[i].replace(/<\/|>/g, "");
      const lastOpenedTag = listOfOpenTags[listOfOpenTags.length - 1];
      // check if the closed tag matches with the last opened tag
      if (closingTag !== lastOpenedTag) {
        // this could be written to indicate whether it's the opening or closing
        // tag that's missing. But seeing that the test only ask to
        // return the tag, not a description, that what I did here.
        const errorTag = lastOpenedTag || closingTag;
        console.log("not valid", errorTag);
        return errorTag;
      } else {
        listOfOpenTags.pop();
      }
    }
  }

  if (listOfOpenTags.length) {
    const msg = `${listOfOpenTags.length} tag${
      listOfOpenTags.length > 1 ? "s were" : " was"
    } not closed: ${listOfOpenTags}.`;
    console.log(msg);
    return false;
  }
  console.log("valid");

  return true;
}

StringChallenge(str);
