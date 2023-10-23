package hu.codeblurb.backend.service;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import hu.codeblurb.backend.sync.domain.SyncData;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

public class SyncServiceTest {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Test
    public void deserializeExample() throws JsonProcessingException {
        final var example = """
                {"data":[{"id":1,"attributes":{"title":"bundle1","createdAt":"2023-10-07T17:52:10.796Z","updatedAt":"2023-10-07T19:09:59.274Z","included_coding_contents":{"data":[{"id":2,"attributes":{"createdAt":"2023-03-11T22:49:08.929Z","updatedAt":"2023-10-07T20:33:31.124Z","description":"coding1","codingContentType":"DRAG_AND_DROP","title":"coding title","testCases":[{"id":1,"input":"Hello world","expectedOutput":"Hello world","exampleTestCase":false,"hints":[{"id":1,"hintPart":"learn"},{"id":2,"hintPart":"to"},{"id":3,"hintPart":"google"}]},{"id":2,"input":"Hi","expectedOutput":"Hi","exampleTestCase":true,"hints":[{"id":4,"hintPart":"jeesus, just google it bro"}]}],"codeSkeleton":[{"id":1,"codeSkeletonPart":"skeleton"},{"id":2,"codeSkeletonPart":"skeleton2"},{"id":3,"codeSkeletonPart":"skeleton3"}],"codeSnippet":[{"id":1,"codeSnippetPart":"snippet1"},{"id":2,"codeSnippetPart":"snippet2"}]}}]},"included_quiz_contents":{"data":[{"id":1,"attributes":{"createdAt":"2023-03-11T22:55:14.796Z","updatedAt":"2023-10-07T20:01:51.987Z","description":"quizcontent","title":"quiz title","questions":[{"id":1,"question":"question?","solutionIndex":1,"answers":[{"id":2,"answer":"answer1"},{"id":1,"answer":"answer2"},{"id":3,"answer":"answer3"}]},{"id":2,"question":"question2","solutionIndex":2,"answers":[{"id":4,"answer":"answ1"},{"id":5,"answer":"answ2"},{"id":6,"answer":"answ3"}]}]}}]},"included_video_contents":{"data":[]}}},{"id":2,"attributes":{"title":"bundle2","createdAt":"2023-10-07T17:52:21.778Z","updatedAt":"2023-10-07T19:10:07.259Z","included_coding_contents":{"data":[]},"included_quiz_contents":{"data":[]},"included_video_contents":{"data":[{"id":2,"attributes":{"description":"some description to this video","createdAt":"2023-03-11T22:52:41.453Z","updatedAt":"2023-10-07T19:59:16.440Z","title":"video title","video":{"data":{"id":1,"attributes":{"name":"hd0079.mov","alternativeText":null,"caption":null,"width":null,"height":null,"formats":null,"hash":"hd0079_5b80a5bdc6","ext":".mov","mime":"video/quicktime","size":112882.9,"url":"/uploads/hd0079_5b80a5bdc6.mov","previewUrl":null,"provider":"local","provider_metadata":null,"createdAt":"2023-03-11T22:52:29.861Z","updatedAt":"2023-03-11T22:52:29.861Z"}}}}}]}}}],"meta":{"pagination":{"page":1,"pageSize":1000,"pageCount":1,"total":2}}}
                """;

        final var result = objectMapper.readValue(example, SyncData.class);

        assertNotNull(result);
        assertEquals(2, result.getBundles().size());
    }
}
