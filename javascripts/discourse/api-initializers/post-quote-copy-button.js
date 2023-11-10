import { apiInitializer } from "discourse/lib/api";
import PostCopyQuoteButton from "../components/post-copy-quote-button";

export default apiInitializer("0.11.1", (api) => {
  api.renderInOutlet("quote-share-buttons-after", PostCopyQuoteButton);
});
