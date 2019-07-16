using UnityEngine;

public class LookAtTest : MonoBehaviour
{
    [SerializeField] Transform target;
    [SerializeField] Shader shader;
    Material　mat;
    void Start()
    {
        mat = GetComponent<Renderer>().material = new Material(shader);
    }
    void Update()
    {
        mat.SetVector("_Position", transform.position);
        mat.SetVector("_Target", target.position);
    }
}
