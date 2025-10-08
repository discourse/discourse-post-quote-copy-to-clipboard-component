import { apiInitializer } from "discourse/lib/api";
import PostCopyQuoteButton from "../components/post-copy-quote-button";

export default apiInitializer((api) => {
  api.renderInOutlet("quote-share-buttons-after", PostCopyQuoteButton);
});
